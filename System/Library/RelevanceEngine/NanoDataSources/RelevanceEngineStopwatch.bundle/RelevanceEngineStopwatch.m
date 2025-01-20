id REStopwatchBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8290 != -1) {
    dispatch_once(&qword_8290, &stru_4138);
  }
  v0 = (void *)qword_8288;

  return v0;
}

void sub_33F8(id a1)
{
  qword_8288 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id NTKUpNextStopwatchContentForTime(int a1, double a2)
{
  if (qword_82A8 != -1) {
    dispatch_once(&qword_82A8, &stru_4158);
  }
  id v4 = objc_alloc_init((Class)REContent);
  [v4 setHeaderTextProvider:qword_8298];
  [v4 setHeaderImageProvider:qword_82A0];
  v5 = +[NSDate date];
  v6 = v5;
  if ((a1 & 1) == 0)
  {
    uint64_t v7 = [v5 dateByAddingTimeInterval:-a2];

    v6 = (void *)v7;
  }
  v8 = +[CLKRelativeDateTextProvider textProviderWithDate:style:units:](CLKRelativeDateTextProvider, "textProviderWithDate:style:units:", v6, 2, 224, 3600.0);
  [v8 setWantsSubseconds:a2 < 3600.0];
  [v8 setTwoDigitMinuteZeroPadding:1];
  if (a1)
  {
    v9 = [v6 dateByAddingTimeInterval:a2];
    [v8 setRelativeToDate:v9];
  }
  [v4 setDescription1TextProvider:v8];
  [v4 setStyle:1];
  [v4 setUseMonospaceFont:1];
  v10 = +[UIColor colorWithRed:1.0 green:0.58 blue:0.0 alpha:1.0];
  [v4 setTintColor:v10];

  return v4;
}

void sub_35FC(id a1)
{
  v1 = REStopwatchLocalizedString(@"UP_NEXT_STOPWATCH_TITLE");
  uint64_t v2 = +[CLKSimpleTextProvider textProviderWithText:v1];
  v3 = (void *)qword_8298;
  qword_8298 = v2;

  [(id)qword_8298 finalize];
  qword_82A0 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:@"stopwatch"];

  _objc_release_x1();
}

id REStopwatchLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = REStopwatchBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_41F8 table:@"StopwatchDataSource"];

  return v3;
}

id REStopwatchImageNamed(void *a1)
{
  id v1 = a1;
  uint64_t v2 = REStopwatchBundle();
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

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_finalize(void *a1, const char *a2, ...)
{
  return [a1 finalize];
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProviderWithText:");
}