uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  uint64_t v7;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

id sub_100001640()
{
  v0 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  [v0 pointSize];
  v1 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");

  v2 = [v1 _fontScaledLikeTextStyle:UIFontTextStyleTitle3 maximumPointSize:0 compatibleWithTraitCollection:0 forIB:26.0];

  return v2;
}

id sub_100001FB8()
{
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuItemFontType|0x80, 70.0, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  v2 = [CopyOfSystemUIFontWithGrade fontDescriptor];
  CFRelease(UIFontForLanguage);
  CFRelease(CopyOfSystemUIFontWithGrade);
  UIFontDescriptorAttributeName v15 = UIFontDescriptorFeatureSettingsAttribute;
  v12[0] = UIFontFeatureTypeIdentifierKey;
  v12[1] = UIFontFeatureSelectorIdentifierKey;
  v13[0] = &off_100010A48;
  v13[1] = &off_100010A60;
  v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v14[0] = v3;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_100010A78;
  v11[1] = &off_100010A60;
  v4 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v14[1] = v4;
  v5 = +[NSArray arrayWithObjects:v14 count:2];
  v16 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v7 = [v2 fontDescriptorByAddingAttributes:v6];

  v8 = +[UIFont fontWithDescriptor:v7 size:70.0];

  return v8;
}

void sub_100003D08(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = [v19 firstObject];
    v7 = (void *)v6;
    if (a3 || !v6) {
      goto LABEL_18;
    }
    v8 = +[CLPlacemark placemarkWithGEOMapItem:v6];
    v9 = [v8 locality];
    v10 = [v8 administrativeArea];
    v11 = v10;
    if ((!v10 || [v10 isEqualToString:v9])
      && ([v8 country],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          v11,
          (v11 = (void *)v12) == 0)
      || [v11 isEqualToString:v9])
    {
      uint64_t v13 = [v8 ISOcountryCode];

      v11 = (void *)v13;
    }
    if (v9 && v11)
    {
      v14 = +[NSBundle mainBundle];
      UIFontDescriptorAttributeName v15 = [v14 localizedStringForKey:@"%1$@, %2$@", &stru_100010838, 0 value table];
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9, v11);
      [WeakRetained[9] setText:v16];

LABEL_17:
      [WeakRetained _updatePlaceLabelLayout];

LABEL_18:
      [WeakRetained _updateCoordinateLabel];

      goto LABEL_19;
    }
    if (v9)
    {
      id v17 = WeakRetained[9];
      v18 = v9;
    }
    else
    {
      if (!v11) {
        goto LABEL_17;
      }
      id v17 = WeakRetained[9];
      v18 = v11;
    }
    [v17 setText:v18];
    goto LABEL_17;
  }
LABEL_19:
}

void sub_1000044B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double sub_100004F34(double a1, double a2)
{
  if (a2 <= 3.14159265)
  {
    if (a2 < -3.14159265) {
      a2 = a2 + 6.28318531;
    }
  }
  else
  {
    a2 = -(6.28318531 - a2);
  }
  double v2 = a2 - a1;
  if (a2 - a1 > 3.14159265) {
    return a1 - (6.28318531 - v2);
  }
  if (v2 < -3.14159265) {
    return v2 + 6.28318531 + a1;
  }
  return a2;
}

void sub_1000051C4(void *a1, uint64_t a2, double a3)
{
  if (!a1) {
    return;
  }
  if (a2 >= 2)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    uint64_t v13 = +[NSString stringWithUTF8String:"void ConvertDegreeSignToString(CLLocationDegrees, NSString *__autoreleasing *, CoordinateComponent)"];
    [v12 handleFailureInFunction:v13 file:@"Extras.m" lineNumber:101 description:@"Unrecognized component %d" a2];

    uint64_t v6 = (uint64_t)(a3 * 3600.0);
LABEL_4:
    v7 = +[NSBundle mainBundle];
    if (v6 < 0)
    {
      CFStringRef v8 = @"cW";
      CFStringRef v9 = @"W";
    }
    else
    {
      CFStringRef v8 = @"cE";
      CFStringRef v9 = @"E";
    }
    goto LABEL_11;
  }
  uint64_t v6 = (uint64_t)(a3 * 3600.0);
  if (a2) {
    goto LABEL_4;
  }
  v7 = +[NSBundle mainBundle];
  if (v6 < 0)
  {
    CFStringRef v8 = @"cS";
    CFStringRef v9 = @"S";
  }
  else
  {
    CFStringRef v8 = @"cN";
    CFStringRef v9 = @"N";
  }
LABEL_11:
  v10 = [v7 localizedStringForKey:v8 value:v9 table:0];

  id v11 = v10;
  *a1 = v11;
}

id StringWithLocationDirection(double a1)
{
  double v2 = (void *)qword_100017BB0;
  if (!qword_100017BB0)
  {
    id v3 = objc_alloc((Class)NSArray);
    v4 = WebLocalizedString();
    v5 = WebLocalizedString();
    uint64_t v6 = WebLocalizedString();
    v7 = WebLocalizedString();
    CFStringRef v8 = WebLocalizedString();
    CFStringRef v9 = WebLocalizedString();
    v10 = WebLocalizedString();
    id v11 = WebLocalizedString();
    id v12 = [v3 initWithObjects:v4, v5, v6, v7, v8, v9, v10, v11, 0];
    uint64_t v13 = (void *)qword_100017BB0;
    qword_100017BB0 = (uint64_t)v12;

    double v2 = (void *)qword_100017BB0;
  }
  double v14 = fmax(a1, 0.0);
  if (v14 <= 360.0) {
    double v15 = v14;
  }
  else {
    double v15 = 360.0;
  }
  id v16 = [v2 count];
  int64_t v17 = (void)v16 << 32;
  uint64_t v18 = (uint64_t)llround(v15 / 360.0 * (double)(int)v16) % (int)v16;
  if (v18 < 0 || v17 <= (uint64_t)0xFFFFFFFF00000000)
  {
    v23 = +[NSAssertionHandler currentHandler];
    v24 = +[NSString stringWithUTF8String:"NSString *StringWithLocationDirection(CLLocationDirection)"];
    [v23 handleFailureInFunction:v24 file:@"Extras.m" lineNumber:158 description:@"Octant index is out of range (degrees:%f octantIndex:%ld)" *(void *)&v15, v18];
  }
  if (v17 <= (uint64_t)0xFFFFFFFF00000000 || v18 <= -1) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = v18;
  }
  v21 = (void *)qword_100017BB0;

  return [v21 objectAtIndex:v20];
}

id CreateCoordinateComponentString(uint64_t a1, double a2, double a3)
{
  if (a1) {
    a2 = a3;
  }
  double v3 = fabs((a2 - (double)(uint64_t)a2) * 60.0);
  uint64_t v4 = (uint64_t)v3;
  double v5 = (v3 - (double)(uint64_t)v3) * 60.0;
  if ((uint64_t)a2 >= 0) {
    uint64_t v6 = (uint64_t)a2;
  }
  else {
    uint64_t v6 = -(uint64_t)a2;
  }
  id v18 = 0;
  sub_1000051C4(&v18, a1, a2);
  id v7 = v18;
  CFStringRef v8 = +[NSNumber numberWithInteger:v6];
  CFStringRef v9 = +[NSNumberFormatter localizedStringFromNumber:v8 numberStyle:0];

  v10 = +[NSNumber numberWithInteger:v4];
  id v11 = +[NSNumberFormatter localizedStringFromNumber:v10 numberStyle:0];

  id v12 = +[NSNumber numberWithDouble:v5];
  uint64_t v13 = +[NSNumberFormatter localizedStringFromNumber:v12 numberStyle:0];

  id v14 = objc_alloc((Class)NSString);
  double v15 = WebLocalizedString();
  id v16 = [v14 initWithFormat:v15, v9, v11, v13, v7, 0];

  return v16;
}

id sub_1000066BC()
{
  v0 = +[NSThread currentThread];
  v1 = [v0 threadDictionary];
  id v2 = [v1 objectForKey:@"CompassHeadingFormatterKey"];

  if (!v2)
  {
    id v2 = objc_alloc_init((Class)NSNumberFormatter);
    [v2 setNumberStyle:0];
    double v3 = +[NSLocale autoupdatingCurrentLocale];
    [v2 setLocale:v3];

    [v2 setNegativePrefix:@"−"];
    uint64_t v4 = +[NSThread currentThread];
    double v5 = [v4 threadDictionary];
    [v5 setObject:v2 forKey:@"CompassHeadingFormatterKey"];
  }

  return v2;
}

double sub_100006818(double a1)
{
  return round(a1 * 118.0 / 320.0);
}

double sub_100006838(double a1)
{
  return round(a1 * 133.0 / 320.0);
}

double sub_100006858(double a1)
{
  return round(a1 * 100.0 / 320.0);
}

double sub_100006878(double a1)
{
  return round(a1 * 77.0 / 320.0);
}

double sub_100006898(double a1)
{
  return round(a1 * 92.0 / 320.0);
}

double sub_1000068B8(double a1)
{
  return round(a1 * 140.0 / 320.0);
}

double sub_1000068D8(double a1)
{
  return round(a1 * 63.0 / 320.0);
}

double sub_100006E38(double a1)
{
  return round(a1 * 15.0 / 320.0);
}

double sub_100006E54(double a1)
{
  return round(a1 * 120.0 / 320.0);
}

double sub_100006E74(double a1)
{
  return round(a1 * 17.0 / 320.0);
}

double sub_100006E90(double a1)
{
  return round(a1 * 71.0 / 320.0);
}

double sub_100006EB0(double a1)
{
  return round(a1 * 30.0 / 320.0);
}

double sub_100006ECC(double a1)
{
  return round(a1 * 49.5 / 320.0);
}

void sub_100007014(double a1, double a2)
{
}

double RoundHeading(double a1)
{
  return fmod(round(a1), 360.0);
}

void sub_100007068()
{
  if (qword_100017BA8 != -1) {
    dispatch_once(&qword_100017BA8, &stru_100010430);
  }
}

void sub_1000070EC(id a1)
{
  id v2 = +[UIScreen mainScreen];
  [v2 scale];
  qword_1000179C0 = v1;
}

double sub_10000713C(double a1, double a2, double a3)
{
  return a1 + a3 * (a2 - a1);
}

double sub_100007148(uint64_t *a1, void *a2, double *a3, double a4)
{
  if (a1)
  {
    uint64_t v4 = (uint64_t)a4;
    if ((uint64_t)a4 < 0) {
      uint64_t v4 = -v4;
    }
    *a1 = v4;
  }
  double result = fabs((a4 - (double)(uint64_t)a4) * 60.0);
  if (a2) {
    *a2 = (uint64_t)result;
  }
  if (a3)
  {
    double result = (result - (double)(uint64_t)result) * 60.0;
    *a3 = result;
  }
  return result;
}

id sub_100007648(uint64_t a1)
{
  return [UIApp startedTest:*(void *)(a1 + 32)];
}

BOOL sub_10000794C(double a1, double a2, float a3)
{
  if (a1 >= a2) {
    double v3 = a2;
  }
  else {
    double v3 = a1;
  }
  if (a1 < a2) {
    a1 = a2;
  }
  if (a1 - v3 > a3) {
    return 1;
  }
  double v5 = a3;
  do
  {
    BOOL result = a1 > v5 && v3 < v5;
    double v5 = v5 + a3;
  }
  while (v5 < 360.0 && !result);
  return result;
}

void sub_100007FC0(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[2] setBearing];
    WeakRetained = v2;
  }
}

void sub_10000858C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000085B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = (double *)WeakRetained;
  if (WeakRetained)
  {
    double v4 = 1.0;
    if (!*(unsigned char *)(a1 + 40)) {
      double v4 = 0.0;
    }
    [*((id *)WeakRetained + 3) setAlpha:v4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v5 = [v3 degreeLabels];
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [v10 text];
          int v12 = [v11 intValue];

          if (!*(unsigned char *)(a1 + 40)
            || (sub_100007014(v3[7], (double)v12), v14 = v13, double v15 = 0.0, v14 >= 12.0)
            && (double v15 = 0.699999988, !*(unsigned char *)(a1 + 40)))
          {
            double v15 = 1.0;
          }
          [v10 setAlpha:v15];
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
  }
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return _CTFontCreateCopyOfSystemUIFontWithGrade();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGIsDeviceOfType()
{
  return _MGIsDeviceOfType();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t WebLocalizedString()
{
  return _WebLocalizedString();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
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
  return _dispatch_time(when, delta);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_ISOcountryCode(void *a1, const char *a2, ...)
{
  return [a1 ISOcountryCode];
}

id objc_msgSend__geocodeIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _geocodeIfNecessary];
}

id objc_msgSend__limitsPrecision(void *a1, const char *a2, ...)
{
  return [a1 _limitsPrecision];
}

id objc_msgSend__setSharedLocationManagerOnPagesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _setSharedLocationManagerOnPagesIfNeeded];
}

id objc_msgSend__shouldHideCoordinateLabel(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideCoordinateLabel];
}

id objc_msgSend__updateCoordinateLabel(void *a1, const char *a2, ...)
{
  return [a1 _updateCoordinateLabel];
}

id objc_msgSend__updatePlaceLabelLayout(void *a1, const char *a2, ...)
{
  return [a1 _updatePlaceLabelLayout];
}

id objc_msgSend__updatePlaceLabels(void *a1, const char *a2, ...)
{
  return [a1 _updatePlaceLabels];
}

id objc_msgSend_addConstraints(void *a1, const char *a2, ...)
{
  return [a1 addConstraints];
}

id objc_msgSend_administrativeArea(void *a1, const char *a2, ...)
{
  return [a1 administrativeArea];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return [a1 altitude];
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return [a1 angle];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_bearingLabel(void *a1, const char *a2, ...)
{
  return [a1 bearingLabel];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_compassHeading(void *a1, const char *a2, ...)
{
  return [a1 compassHeading];
}

id objc_msgSend_configuredForTesting(void *a1, const char *a2, ...)
{
  return [a1 configuredForTesting];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return [a1 country];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultTraits(void *a1, const char *a2, ...)
{
  return [a1 defaultTraits];
}

id objc_msgSend_degreeLabels(void *a1, const char *a2, ...)
{
  return [a1 degreeLabels];
}

id objc_msgSend_deviceMotion(void *a1, const char *a2, ...)
{
  return [a1 deviceMotion];
}

id objc_msgSend_directionLabels(void *a1, const char *a2, ...)
{
  return [a1 directionLabels];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptor];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return [a1 generalPasteboard];
}

id objc_msgSend_generateTestDeviceMotionArray(void *a1, const char *a2, ...)
{
  return [a1 generateTestDeviceMotionArray];
}

id objc_msgSend_gravity(void *a1, const char *a2, ...)
{
  return [a1 gravity];
}

id objc_msgSend_heading(void *a1, const char *a2, ...)
{
  return [a1 heading];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_impactOccurred(void *a1, const char *a2, ...)
{
  return [a1 impactOccurred];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isInternalInstall];
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 isMovingFromParentViewController];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 lastBaselineAnchor];
}

id objc_msgSend_latLng(void *a1, const char *a2, ...)
{
  return [a1 latLng];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return [a1 layoutSubviews];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_locality(void *a1, const char *a2, ...)
{
  return [a1 locality];
}

id objc_msgSend_magneticField(void *a1, const char *a2, ...)
{
  return [a1 magneticField];
}

id objc_msgSend_magneticFieldCalibrationLevel(void *a1, const char *a2, ...)
{
  return [a1 magneticFieldCalibrationLevel];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return [a1 orangeColor];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_referenceFrame(void *a1, const char *a2, ...)
{
  return [a1 referenceFrame];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestWhenInUseAuthorization(void *a1, const char *a2, ...)
{
  return [a1 requestWhenInUseAuthorization];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_setBearing(void *a1, const char *a2, ...)
{
  return [a1 setBearing];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedLocManager(void *a1, const char *a2, ...)
{
  return [a1 sharedLocManager];
}

id objc_msgSend_sharedPlatform(void *a1, const char *a2, ...)
{
  return [a1 sharedPlatform];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return [a1 shortDescription];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return [a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldSetBearing(void *a1, const char *a2, ...)
{
  return [a1 shouldSetBearing];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAnimations(void *a1, const char *a2, ...)
{
  return [a1 startAnimations];
}

id objc_msgSend_startLocationUpdatesIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 startLocationUpdatesIfNecessary];
}

id objc_msgSend_startMotionManager(void *a1, const char *a2, ...)
{
  return [a1 startMotionManager];
}

id objc_msgSend_startUpdatingHeading(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingHeading];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopAnimations(void *a1, const char *a2, ...)
{
  return [a1 stopAnimations];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}

id objc_msgSend_stopLocationUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopLocationUpdates];
}

id objc_msgSend_stopUpdatingHeading(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingHeading];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_testMotion(void *a1, const char *a2, ...)
{
  return [a1 testMotion];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_threadDictionary(void *a1, const char *a2, ...)
{
  return [a1 threadDictionary];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_triangleView(void *a1, const char *a2, ...)
{
  return [a1 triangleView];
}

id objc_msgSend_updateConsole(void *a1, const char *a2, ...)
{
  return [a1 updateConsole];
}

id objc_msgSend_updateLayer(void *a1, const char *a2, ...)
{
  return [a1 updateLayer];
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 verticalAccuracy];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}