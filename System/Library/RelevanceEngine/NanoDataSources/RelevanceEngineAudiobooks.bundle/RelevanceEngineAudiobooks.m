id REAudiobooksBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_8408 != -1) {
    dispatch_once(&qword_8408, &stru_4108);
  }
  v0 = (void *)qword_8400;

  return v0;
}

void sub_3724(id a1)
{
  qword_8400 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id REAudiobooksImageNamed(void *a1)
{
  id v1 = a1;
  v2 = REAudiobooksBundle();
  v3 = REImageNamedFromBundle();

  return v3;
}

id REAudiobooksLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = REAudiobooksBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_4188 table:@"AudiobooksDataSource"];

  return v3;
}

id REAudiobooksSampleContent()
{
  v0 = REAudiobooksImageNamed(@"AppIcon");
  id v1 = REAudiobooksLocalizedString(@"RE_AUDIOBOOKS_APP_NAME");
  v2 = +[CLKSimpleTextProvider textProviderWithText:v1];
  v3 = REAudiobooksImageNamed(@"Sample");
  v4 = REAudiobooksLocalizedString(@"RE_AUDIOBOOKS_SAMPLE_TITLE");
  v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
  id v6 = objc_alloc_init((Class)REContent);
  [v6 setOverrideHeaderImage:v0];
  [v6 setHeaderTextProvider:v2];
  [v6 setOverrideBodyImage:v3];
  [v6 setDescription1TextProvider:v5];

  return v6;
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

id objc_msgSend_textProviderWithText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProviderWithText:");
}