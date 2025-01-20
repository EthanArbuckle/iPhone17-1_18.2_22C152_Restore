id REWalletBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8260 != -1) {
    dispatch_once(&qword_8260, &stru_4140);
  }
  v0 = (void *)qword_8258;

  return v0;
}

void sub_3738(id a1)
{
  qword_8258 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id REWalletLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = REWalletBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_4240 table:@"WalletDataSource"];

  return v3;
}

id REWalletImageNamed(void *a1)
{
  id v1 = a1;
  v2 = REWalletBundle();
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

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProviderWithText:");
}