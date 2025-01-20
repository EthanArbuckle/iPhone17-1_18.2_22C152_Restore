BOOL NACGFloatGreaterThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 > a2;
}

uint64_t NAStringFromCGPoint(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

uint64_t NAStringFromCGSize(double a1, double a2)
{
  return [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
}

id NAStringFromCGRect(double a1, double a2, double a3, double a4)
{
  v6 = NSString;
  v7 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a1, 17, *(void *)&a2];
  v8 = [NSString stringWithFormat:@"{%.*g, %.*g}", 17, *(void *)&a3, 17, *(void *)&a4];
  v9 = [v6 stringWithFormat:@"{%@, %@}", v7, v8];

  return v9;
}

BOOL NACGFloatIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

BOOL NACGFloatIsOne(double a1)
{
  return fabs(a1 + -1.0) < 2.22044605e-16;
}

BOOL NACGFloatEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

BOOL NACGFloatLessThanFloat(double a1, double a2)
{
  if (a1 >= a2) {
    return 0;
  }
  float v2 = a1;
  float v3 = a2;
  return vabds_f32(v2, v3) >= 0.00000011921;
}

BOOL NACGFloatLessThanOrEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16 || a1 < a2;
}

BOOL NACGFloatGreaterThanFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) >= 2.22044605e-16 && a1 > a2;
}

double NACGFloatCeilForScale(double a1, double a2)
{
  if (fabs(a2) < 2.22044605e-16)
  {
    +[NAUIDeviceUtilities mainScreenScale];
    a2 = v3;
  }
  return ceil(a2 * a1) / a2;
}

double NACGFloatPowerOf2Ceil(double a1)
{
  double result = 0.0;
  if (a1 > 0.0)
  {
    uint64_t v3 = vcvtpd_u64_f64(a1);
    if ((v3 & (v3 - 1)) != 0)
    {
      do
      {
        uint64_t v4 = v3;
        v3 &= v3 - 1;
      }
      while (v3);
      uint64_t v3 = 2 * v4;
    }
    return (double)(unint64_t)v3;
  }
  return result;
}

double NACGFloatEpsilon()
{
  return 2.22044605e-16;
}

double NACGFloatByLinearlyInterpolatingFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

BOOL NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = [v4 preferredContentSizeCategory];
  if ([v3 isEqualToString:v5])
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory_block_invoke;
    v8[3] = &unk_264627CC0;
    id v9 = v3;
    v11 = &v12;
    id v10 = v5;
    NAUIEnumerateContentSizeCategoriesInIncreasingOrder(1, 1, v8);
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }

  return v6;
}

void sub_2227B5530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void NAUIEnumerateContentSizeCategoriesInIncreasingOrder(int a1, int a2, void *a3)
{
  id v5 = a3;
  if (NAUIEnumerateContentSizeCategoriesInIncreasingOrder_onceToken != -1) {
    dispatch_once(&NAUIEnumerateContentSizeCategoriesInIncreasingOrder_onceToken, &__block_literal_global);
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (!a1) {
    goto LABEL_5;
  }
  BOOL v6 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_smallerThanDefaultSizes;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_2;
  v16[3] = &unk_264627CE8;
  id v17 = v5;
  v18 = &v19;
  [v6 enumerateObjectsUsingBlock:v16];

  if (!*((unsigned char *)v20 + 24))
  {
LABEL_5:
    v7 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_normalSizes;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_3;
    v13[3] = &unk_264627CE8;
    id v8 = v5;
    id v14 = v8;
    char v15 = &v19;
    [v7 enumerateObjectsUsingBlock:v13];

    if (!*((unsigned char *)v20 + 24) && a2)
    {
      id v9 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_accessibilitySizes;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_4;
      v10[3] = &unk_264627CE8;
      id v11 = v8;
      uint64_t v12 = &v19;
      [v9 enumerateObjectsUsingBlock:v10];
    }
  }
  _Block_object_dispose(&v19, 8);
}

void sub_2227B5730(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __NAUICurrentContentSizeCategoryIsLargerThanOrEqualToCategory_block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  char v5 = [v7 isEqualToString:a1[4]];
  char v6 = 1;
  if ((v5 & 1) == 0)
  {
    if (![v7 isEqualToString:a1[5]]) {
      goto LABEL_5;
    }
    char v6 = 0;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v6;
  *a3 = 1;
LABEL_5:
}

__CFString *NAUIShortDescriptionFromUIContentSizeCategory(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:*MEMORY[0x263F1D178]])
  {
    float v2 = @"xSM";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D198]])
  {
    float v2 = @"SM";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D188]])
  {
    float v2 = @"M";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D180]])
  {
    float v2 = @"L";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D170]])
  {
    float v2 = @"XL";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D168]])
  {
    float v2 = @"XXL";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D160]])
  {
    float v2 = @"XXXL";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D150]])
  {
    float v2 = @"AX-M";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D148]])
  {
    float v2 = @"AX-L";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D140]])
  {
    float v2 = @"AX-XL";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D138]])
  {
    float v2 = @"AX-XXL";
  }
  else if ([v1 isEqualToString:*MEMORY[0x263F1D130]])
  {
    float v2 = @"AX-XXXL";
  }
  else
  {
    float v2 = @"??";
  }

  return v2;
}

void __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke()
{
  v13[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1D198];
  v13[0] = *MEMORY[0x263F1D178];
  v13[1] = v0;
  v13[2] = *MEMORY[0x263F1D188];
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  float v2 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_smallerThanDefaultSizes;
  NAUIEnumerateContentSizeCategoriesInIncreasingOrder_smallerThanDefaultSizes = v1;

  uint64_t v3 = *MEMORY[0x263F1D170];
  v12[0] = *MEMORY[0x263F1D180];
  v12[1] = v3;
  uint64_t v4 = *MEMORY[0x263F1D160];
  v12[2] = *MEMORY[0x263F1D168];
  v12[3] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  char v6 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_normalSizes;
  NAUIEnumerateContentSizeCategoriesInIncreasingOrder_normalSizes = v5;

  uint64_t v7 = *MEMORY[0x263F1D148];
  v11[0] = *MEMORY[0x263F1D150];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x263F1D138];
  v11[2] = *MEMORY[0x263F1D140];
  v11[3] = v8;
  v11[4] = *MEMORY[0x263F1D130];
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
  id v10 = (void *)NAUIEnumerateContentSizeCategoriesInIncreasingOrder_accessibilitySizes;
  NAUIEnumerateContentSizeCategoriesInIncreasingOrder_accessibilitySizes = v9;
}

uint64_t __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __NAUIEnumerateContentSizeCategoriesInIncreasingOrder_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

__CFString *NAUIStringFromLayoutAttribute(unint64_t a1)
{
  if (a1 > 0x14) {
    return @"NSLayoutAttribute(?)";
  }
  else {
    return off_264627D58[a1];
  }
}

void sub_2227B6CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2227B6D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

double UIScreenPixelHeight()
{
  uint64_t v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 scale];
  double v2 = 1.0 / v1;

  return v2;
}

id NAUILayoutMetricsForUIEdgeInsetsNamed(void *a1, double a2, double a3, double a4, double a5)
{
  v21[4] = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = UIEdgeInsetKeyNamed(v9, @"top");
  v20[0] = v10;
  id v11 = [NSNumber numberWithDouble:a2];
  v21[0] = v11;
  uint64_t v12 = UIEdgeInsetKeyNamed(v9, @"bottom");
  v20[1] = v12;
  v13 = [NSNumber numberWithDouble:a4];
  v21[1] = v13;
  id v14 = UIEdgeInsetKeyNamed(v9, @"left");
  v20[2] = v14;
  char v15 = [NSNumber numberWithDouble:a3];
  v21[2] = v15;
  v16 = UIEdgeInsetKeyNamed(v9, @"right");

  v20[3] = v16;
  id v17 = [NSNumber numberWithDouble:a5];
  v21[3] = v17;
  v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return v18;
}

id UIEdgeInsetKeyNamed(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 length])
  {
    id v5 = [NSString stringWithFormat:@"%@_%@", v3, v4];
  }
  else
  {
    id v5 = v4;
  }
  char v6 = v5;

  return v6;
}

void sub_2227B783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2227B7A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

BOOL NAUIIsCJKCharacter()
{
  return uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript()
      || uscript_hasScript() != 0;
}

id NSStringFromUIInterfaceOrientationMask(char a1)
{
  double v2 = [MEMORY[0x263EFF980] array];
  id v3 = v2;
  if ((a1 & 0x10) != 0)
  {
    [v2 addObject:@"landscape-left"];
    if ((a1 & 8) == 0)
    {
LABEL_3:
      if ((a1 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 addObject:@"landscape-right"];
  if ((a1 & 2) == 0)
  {
LABEL_4:
    if ((a1 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v3 addObject:@"portrait"];
  if ((a1 & 4) != 0) {
LABEL_5:
  }
    [v3 addObject:@"portrait-upside-down"];
LABEL_6:
  id v4 = [v3 componentsJoinedByString:@" | "];

  return v4;
}

id NSStringFromUIInterfaceOrientation(char a1)
{
  return NSStringFromUIInterfaceOrientationMask(1 << a1);
}

void sub_2227B9C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double NARectWithCGSize()
{
  return *MEMORY[0x263F00148];
}

double NADegreesToRadians(double a1)
{
  return a1 * 0.0174532925;
}

double NARadiansToDegrees(double a1)
{
  return a1 * 57.2957795;
}

double NARadiansFromCGAffineTransform(long double *a1)
{
  return atan2(a1[1], *a1);
}

void sub_2227BAFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return (CTFontRef)MEMORY[0x270EE9AD8](*(void *)&uiType, language, size);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t uscript_hasScript()
{
  return MEMORY[0x270F998F0]();
}