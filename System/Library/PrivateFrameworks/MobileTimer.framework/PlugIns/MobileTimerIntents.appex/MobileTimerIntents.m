void sub_1000016B4(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  uint64_t vars8;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = [objc_alloc((Class)INObjectCollection) initWithItems:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000188C(uint64_t a1, uint64_t a2)
{
  id v7 = +[MTUtilities mtCityFromWorldClockCity:a2];
  v3 = +[NSBundle bundleWithIdentifier:@"com.apple.mobiletimer-framework"];
  uint64_t v4 = [v7 identifier];
  v5 = [v3 localizedStringForKey:v4 value:&stru_100004258 table:@"WorldClock"];

  v6 = [v7 identifier];
  LOBYTE(v4) = [v5 isEqualToString:v6];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void sub_1000020D0(uint64_t a1, id a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    id v5 = a2;
    a2 = [objc_alloc((Class)INObjectCollection) initWithItems:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000022A8(uint64_t a1, uint64_t a2)
{
  id v7 = +[MTUtilities mtCityFromWorldClockCity:a2];
  v3 = +[NSBundle bundleWithIdentifier:@"com.apple.mobiletimer-framework"];
  uint64_t v4 = [v7 identifier];
  id v5 = [v3 localizedStringForKey:v4 value:&stru_100004258 table:@"WorldClock"];

  id v6 = [v7 identifier];
  LOBYTE(v4) = [v5 isEqualToString:v6];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_abbreviation(void *a1, const char *a2, ...)
{
  return [a1 abbreviation];
}

id objc_msgSend_alarmManager(void *a1, const char *a2, ...)
{
  return [a1 alarmManager];
}

id objc_msgSend_allCities(void *a1, const char *a2, ...)
{
  return [a1 allCities];
}

id objc_msgSend_allClocks(void *a1, const char *a2, ...)
{
  return [a1 allClocks];
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return [a1 cities];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return [a1 displayString];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isDaylightSavingTime(void *a1, const char *a2, ...)
{
  return [a1 isDaylightSavingTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_timeZoneName(void *a1, const char *a2, ...)
{
  return [a1 timeZoneName];
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneWithName:");
}