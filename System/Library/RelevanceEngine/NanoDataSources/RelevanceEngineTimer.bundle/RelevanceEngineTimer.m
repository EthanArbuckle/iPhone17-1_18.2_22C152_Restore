id RETimerBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8280 != -1) {
    dispatch_once(&qword_8280, &stru_4138);
  }
  v0 = (void *)qword_8278;

  return v0;
}

void sub_3568(id a1)
{
  qword_8278 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id RETimerContent(char a1, double a2)
{
  v4 = objc_opt_new();
  v5 = RETimerLocalizedString(@"UP_NEXT_TIMER_TITLE");
  v6 = +[CLKSimpleTextProvider textProviderWithText:v5];
  [v4 setHeaderTextProvider:v6];

  v7 = +[UIColor colorWithRed:1.0 green:0.58 blue:0.0 alpha:1.0];
  [v4 setTintColor:v7];

  v8 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:@"timer"];
  [v4 setHeaderImageProvider:v8];
  v9 = +[NSDate date];
  v10 = [v9 dateByAddingTimeInterval:a2];
  v11 = +[CLKRelativeDateTextProvider textProviderWithDate:v10 style:2 units:224];
  [v11 setPauseTimerAtZero:1];
  [v11 setTwoDigitMinuteZeroPadding:1];
  if ((a1 & 1) == 0) {
    [v11 setRelativeToDate:v9];
  }
  [v4 setDescription1TextProvider:v11];
  [v4 setStyle:1];

  return v4;
}

id RETimerLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = RETimerBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_41F8 table:@"TimerDataSource"];

  return v3;
}

id RETimerImageNamed(void *a1)
{
  id v1 = a1;
  v2 = RETimerBundle();
  v3 = REImageNamedFromBundle();

  return v3;
}

uint64_t REImageNamedFromBundle()
{
  return _REImageNamedFromBundle();
}

uint64_t REUISampleRelevanceProviderForSamplePosition()
{
  return _REUISampleRelevanceProviderForSamplePosition();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProviderWithText:");
}