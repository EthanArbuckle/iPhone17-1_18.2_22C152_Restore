void sub_2293829C4(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  v1 = [*(id *)(a1 + 32) delegate];
  [v1 invalidateElements];
}

void sub_229383338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229383354(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    v3 = [WeakRetained _elementForEvent:*(void *)(a1 + 32)];
    v4 = [v5 delegate];
    [v4 reloadElement:v3];

    id WeakRetained = v5;
  }
}

__CFString *NSRESolarEventTypeSuffix(uint64_t a1)
{
  v1 = @"sunset";
  if (a1 != 1) {
    v1 = 0;
  }
  if (a1) {
    return v1;
  }
  else {
    return @"sunrise";
  }
}

id sub_229383BBC()
{
  if (qword_268316258 != -1) {
    dispatch_once(&qword_268316258, &unk_26DD78658);
  }
  v0 = (void *)qword_268316250;

  return v0;
}

void sub_229383C10()
{
  id v3 = [MEMORY[0x263EFF8F0] currentCalendar];
  v0 = [MEMORY[0x263EFF910] now];
  uint64_t v1 = [v3 dateBySettingHour:20 minute:25 second:0 ofDate:v0 options:0];
  v2 = (void *)qword_268316250;
  qword_268316250 = v1;
}

id NSRELocalizationBundle()
{
  if (qword_268316268 != -1) {
    dispatch_once(&qword_268316268, &unk_26DD78678);
  }
  v0 = (void *)qword_268316260;

  return v0;
}

uint64_t sub_229383FAC()
{
  qword_268316260 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

id NSRELocalizedImageNamed(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x263F1C6B0];
  id v2 = a1;
  id v3 = NSRELocalizationBundle();
  v4 = [MEMORY[0x263F1C920] mainScreen];
  id v5 = [v4 traitCollection];
  v6 = [v1 imageNamed:v2 inBundle:v3 compatibleWithTraitCollection:v5];

  return v6;
}

id NSRELocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = NSRELocalizationBundle();
  id v3 = [v2 localizedStringForKey:v1 value:&stru_26DD788F8 table:0];

  return v3;
}

id NSRELocationKey(double a1, double a2)
{
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a1))
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.04f,%.04f", *(void *)&a1, *(void *)&a2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t NSRELocationKeyHash(double a1, double a2)
{
  id v2 = NSRELocationKey(a1, a2);
  uint64_t v3 = [v2 hash];

  return v3;
}

id NSRELogger()
{
  if (qword_268316278 != -1) {
    dispatch_once(&qword_268316278, &unk_26DD78698);
  }
  v0 = (void *)qword_268316270;

  return v0;
}

uint64_t sub_229384214()
{
  qword_268316270 = (uint64_t)os_log_create("com.apple.nanotimeapps", "SunriseRelevanceEngine");

  return MEMORY[0x270F9A758]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return MEMORY[0x270F59AC0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}