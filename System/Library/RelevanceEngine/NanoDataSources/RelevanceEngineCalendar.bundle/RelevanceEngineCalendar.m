id RECalendarBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_82F0 != -1) {
    dispatch_once(&qword_82F0, &stru_41B8);
  }
  v0 = (void *)qword_82E8;

  return v0;
}

void sub_2D94(id a1)
{
  qword_82E8 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id RECalendarLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = RECalendarBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_4298 table:@"CalendarDataSource"];

  return v3;
}

id RECalendarLocalizedFormat(void *a1)
{
  id v1 = a1;
  v2 = RECalendarBundle();
  v3 = [v2 localizedStringForKey:v1 value:&stru_4298 table:@"CalendarDataSourceFormat"];

  return v3;
}

id RECalendarImageNamed(void *a1)
{
  id v1 = a1;
  v2 = RECalendarBundle();
  v3 = REImageNamedFromBundle();

  return v3;
}

id RECalendarPillImage()
{
  if (qword_8300 != -1) {
    dispatch_once(&qword_8300, &stru_41D8);
  }
  v0 = (void *)qword_82F8;

  return v0;
}

void sub_2F90(id a1)
{
  id v1 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", 2.0, 3.0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3068;
  v6[3] = &unk_41F8;
  long long v7 = xmmword_3AC0;
  uint64_t v2 = [v1 imageWithActions:v6];
  v3 = (void *)qword_82F8;
  qword_82F8 = v2;

  uint64_t v4 = objc_msgSend((id)qword_82F8, "resizableImageWithCapInsets:", 2.0, 0.0, 2.0, 0.0);
  v5 = (void *)qword_82F8;
  qword_82F8 = v4;
}

void sub_3068(uint64_t a1)
{
  uint64_t v2 = +[UIColor whiteColor];
  [v2 setFill];

  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", CGPointZero.x, CGPointZero.y, *(double *)(a1 + 32), *(double *)(a1 + 40), 1.0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 fill];
}

id RECalendarBaseContent(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_opt_new();
  if ([v8 length])
  {
    v12 = +[CLKSimpleTextProvider textProviderWithText:v8];
  }
  else
  {
    v12 = 0;
  }
  if ([v9 length])
  {
    v13 = +[CLKSimpleTextProvider textProviderWithText:v9];
  }
  else
  {
    v13 = 0;
  }
  v14 = +[CLKSimpleTextProvider textProviderWithText:v7];
  [v11 setDescription1TextProvider:v14];
  v15 = v12;
  if (v12 || (v15 = v13) != 0) {
    [v11 setDescription2TextProvider:v15];
  }
  [v11 setBodyImageShouldStretch:1];
  v16 = RECalendarPillImage();
  v17 = +[CLKImageProvider imageProviderWithOnePieceImage:v16];
  [v11 setBodyImageProvider:v17];

  [v11 setTintColor:v10];

  return v11;
}

id RECalendarContent(void *a1, void *a2, void *a3, void *a4, void *a5, int a6, int a7)
{
  id v13 = a5;
  v14 = RECalendarBaseContent(a1, a2, a3, a4);
  if (a6 && a7)
  {
    v15 = [v13 startDate];
    v16 = v15;
    uint64_t v17 = 536;
LABEL_6:
    v18 = +[CLKDateTextProvider textProviderWithDate:v16 units:v17];
    [v14 setHeaderTextProvider:v18];

    goto LABEL_8;
  }
  if (a6)
  {
    v15 = [v13 startDate];
    v16 = v15;
    uint64_t v17 = 24;
    goto LABEL_6;
  }
  v19 = [v13 startDate];
  v20 = [v13 endDate];
  v21 = +[CLKTimeIntervalTextProvider textProviderWithStartDate:v19 endDate:v20];
  [v14 setHeaderTextProvider:v21];

  v22 = [v13 startDate];
  v15 = +[CLKTimeTextProvider textProviderWithDate:v22];

  [v15 setPrefersDesignatorToMinutes:1];
LABEL_8:

  return v14;
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

void objc_release(id a1)
{
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

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return [a1 fill];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return [a1 setFill];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}