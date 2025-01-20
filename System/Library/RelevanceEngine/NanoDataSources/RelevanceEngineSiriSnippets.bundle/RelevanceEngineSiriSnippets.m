id RESiriSnippetsBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8250 != -1) {
    dispatch_once(&qword_8250, &stru_4168);
  }
  v0 = (void *)qword_8248;

  return v0;
}

void sub_2F48(id a1)
{
  qword_8248 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

uint64_t RESiriSnippetShowAllSnippets()
{
  if (qword_8260 != -1) {
    dispatch_once(&qword_8260, &stru_4188);
  }
  return byte_8258;
}

void sub_2FE8(id a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  sub_305C();
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  byte_8258 = CFPreferencesGetAppBooleanValue(@"UpNextShowAllSnippets", v1, &keyExistsAndHasValidFormat) != 0;

  if (keyExistsAndHasValidFormat) {
    BOOL v2 = byte_8258 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = !v2;
  byte_8258 = v3;
}

id sub_305C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_8278;
  uint64_t v7 = qword_8278;
  if (!qword_8278)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_3494;
    v3[3] = &unk_4210;
    v3[4] = &v4;
    sub_3494((uint64_t)v3);
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_37AC();
  }
  v1 = *v0;

  return v1;
}

void sub_3128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RESiriSnippetAlwaysShow()
{
  if (qword_8270 != -1) {
    dispatch_once(&qword_8270, &stru_41A8);
  }
  return byte_8268;
}

void sub_3184(id a1)
{
  Boolean keyExistsAndHasValidFormat = 0;
  sub_305C();
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  byte_8268 = CFPreferencesGetAppBooleanValue(@"UpNextAlwaysShowSnippets", v1, &keyExistsAndHasValidFormat) != 0;

  if (keyExistsAndHasValidFormat) {
    BOOL v2 = byte_8268 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  char v3 = !v2;
  byte_8268 = v3;
}

id RESiriSnippetCreateElementFromString(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)REContent);
  char v3 = +[CLKSimpleTextProvider textProviderWithText:v1];
  [v2 setDescription1TextProvider:v3];

  [v2 setDescription1FontStyle:1];
  id v4 = [objc_alloc((Class)REElementBlockAction) initWithAction:&stru_41E8];
  if (qword_8260 != -1) {
    dispatch_once(&qword_8260, &stru_4188);
  }
  v5 = @"com.apple.NanoTimeKit.SiriSnippet";
  if (byte_8258)
  {
    uint64_t v6 = [v1 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    v5 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.NanoTimeKit.SiriSnippet", v6];
  }
  if (qword_8270 != -1) {
    dispatch_once(&qword_8270, &stru_41A8);
  }
  if (byte_8268)
  {
    id v7 = [objc_alloc((Class)REDailyRoutineRelevanceProvider) initWithDailyRoutineType:2];
    id v13 = v7;
    v8 = &v13;
  }
  else
  {
    id v7 = objc_alloc_init((Class)RENoContentRelevanceProvider);
    id v12 = v7;
    v8 = &v12;
  }
  v9 = +[NSArray arrayWithObjects:v8 count:1];

  id v10 = [objc_alloc((Class)REElement) initWithIdentifier:v5 content:v2 action:v4 relevanceProviders:v9 privacyBehavior:0];

  return v10;
}

id RESiriSnippetLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = RESiriSnippetsBundle();
  char v3 = [v2 localizedStringForKey:v1 value:&stru_4328 table:@"SiriSnippetDataSource"];

  return v3;
}

void *sub_3494(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_8280)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_35D4;
    v5[4] = &unk_4248;
    v5[5] = v5;
    long long v6 = off_4230;
    uint64_t v7 = 0;
    qword_8280 = _sl_dlopen();
    char v3 = (void *)v5[0];
    id v2 = (void *)qword_8280;
    if (qword_8280)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      char v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_8280;
LABEL_5:
  result = dlsym(v2, "NTKFacePreferencesDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_8278 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_35D4()
{
  uint64_t result = _sl_dlopen();
  qword_8280 = result;
  return result;
}

void sub_37AC()
{
  dlerror();
  CFStringRef v0 = (const __CFString *)abort_report_np();
  CFPreferencesGetAppBooleanValue(v0, v1, v2);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProviderWithText:");
}