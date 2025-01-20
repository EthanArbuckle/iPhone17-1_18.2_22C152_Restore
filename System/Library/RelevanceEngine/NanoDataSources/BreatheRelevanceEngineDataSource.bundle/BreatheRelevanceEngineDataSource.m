id BRDSBreatheBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8260 != -1) {
    dispatch_once(&qword_8260, &stru_4120);
  }
  v0 = (void *)qword_8258;

  return v0;
}

void sub_3510(id a1)
{
  qword_8258 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id BRDSBreatheContent()
{
  id v0 = objc_alloc_init((Class)REContent);
  [v0 setObject:REElementInteractionTap forKey:REContentInteractionKey];
  v1 = +[CLKDevice currentDevice];
  id v2 = [v1 sizeClass];

  if (v2) {
    v3 = @"SG_Breathe";
  }
  else {
    v3 = @"SG_Breathe_38mm";
  }
  v4 = BRDSBreatheImageNamed(v3);
  [v0 setOverrideBodyImage:v4];
  [v0 setStyle:3];
  v5 = BRDSBreatheLocalizedString(@"UP_NEXT_BREATHE_DESCRIPTION");
  v6 = +[CLKSimpleTextProvider textProviderWithText:v5];
  [v0 setDescription1TextProvider:v6];

  v7 = +[ARUIMetricColors deepBreathingColors];
  v8 = [v7 nonGradientTextColor];
  [v0 setTintColor:v8];

  return v0;
}

id BRDSBreatheImageNamed(void *a1)
{
  id v1 = a1;
  id v2 = BRDSBreatheBundle();
  v3 = REImageNamedFromBundle();

  return v3;
}

id BRDSBreatheLocalizedString(void *a1)
{
  id v1 = a1;
  id v2 = BRDSBreatheBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_41F0 table:@"Localizable"];

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

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_deepBreathingColors(void *a1, const char *a2, ...)
{
  return [a1 deepBreathingColors];
}

id objc_msgSend_nonGradientTextColor(void *a1, const char *a2, ...)
{
  return [a1 nonGradientTextColor];
}

id objc_msgSend_sizeClass(void *a1, const char *a2, ...)
{
  return [a1 sizeClass];
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProviderWithText:");
}