id TTRBundleGet()
{
  void *v0;
  uint64_t vars8;

  if (qword_8550 != -1) {
    dispatch_once(&qword_8550, &stru_41C8);
  }
  v0 = (void *)qword_8548;

  return v0;
}

void sub_297C(id a1)
{
  qword_8548 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id REReminderBundle()
{
  if (qword_8560 != -1) {
    dispatch_once(&qword_8560, &stru_41E8);
  }
  v0 = (void *)qword_8558;

  return v0;
}

void sub_2A2C(id a1)
{
  qword_8558 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

id REReminderDescription2TextProvider(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4)
  {
    if (v3) {
      +[CLKTimeTextProvider textProviderWithDate:v3];
    }
    else {
    v5 = +[CLKSimpleTextProvider textProviderWithText:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id REReminderHeaderImageProvider(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  if (v3 | v4
    && (!v3 ? (CFStringRef v5 = @"location.fill") : (CFStringRef v5 = @"clock"),
        +[UIImage systemImageNamed:v5],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = +[CLKImageProvider imageProviderWithOnePieceImage:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id REReminderLocationName(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (v3 < = [v1 radius];
    {
      CFStringRef v5 = +[NSCharacterSet newlineCharacterSet];
      v6 = [v2 title];
      unint64_t v4 = [v6 _stringByReplacingCharactersInSet:v5 withCharacter:32];
    }
    if ([v4 length]) {
      v7 = v4;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id REReminderContent(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  v9 = REReminderLocationName(a3);
  v10 = REReminderDescription2TextProvider(v8, v9);
  if (v10)
  {
    if ((unint64_t)(a4 - 1) > 2) {
      v11 = &stru_4398;
    }
    else {
      v11 = off_4208[a4 - 1];
    }
    if ([(__CFString *)v11 length])
    {
      v11 = +[NSString stringWithFormat:@"%@ ", v11];
    }
    id v12 = objc_alloc_init((Class)REContent);
    v13 = +[NSString stringWithFormat:@"%@%@", v11, v7];
    v14 = REReminderBundle();
    v15 = [v14 localizedStringForKey:@"UP_NEXT_REMINDERS_TITLE" value:&stru_4398 table:@"ReminderDataSource"];
    v16 = +[CLKSimpleTextProvider textProviderWithText:v15];
    [v12 setHeaderTextProvider:v16];

    v17 = +[CLKSimpleTextProvider textProviderWithText:v13];
    [v12 setDescription1TextProvider:v17];

    [v12 setDescription2TextProvider:v10];
    v18 = +[UIColor whiteColor];
    [v12 setTintColor:v18];

    v19 = REReminderHeaderImageProvider(v8, v9);
    [v12 setHeaderImageProvider:v19];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

id REReminderRelevanceProvider(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  v9 = +[NSMutableArray arrayWithCapacity:2];
  id v10 = objc_alloc((Class)REPriorityRelevanceProvider);
  *(float *)&double v11 = (float)((float)a4 * 0.16333) + 0.5;
  id v12 = [v10 initWithPriority:v11];
  [v9 addObject:v12];
  if (!v7)
  {
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v18 = [v8 title];
    v19 = (void *)v18;
    v20 = &stru_4398;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    v21 = v20;

    id v22 = objc_alloc((Class)CLCircularRegion);
    [v8 latitude];
    CLLocationDegrees v24 = v23;
    [v8 longitude];
    CLLocationCoordinate2D v26 = CLLocationCoordinate2DMake(v24, v25);
    [v8 radius];
    id v13 = objc_msgSend(v22, "initWithCenter:radius:identifier:", v21, v26.latitude, v26.longitude, v27);

    v28 = [v8 referenceFrameString];
    objc_msgSend(v13, "setGeoReferenceFrame:", objc_msgSend(v28, "intValue"));

    if (a3 == 1)
    {
      uint64_t v30 = 0;
      uint64_t v29 = 1;
    }
    else
    {
      if (a3 != 2)
      {
LABEL_11:
        id v14 = [objc_alloc((Class)REGeofenceRelevanceProvider) initWithRegion:v13];
        [v9 addObject:v14];
        goto LABEL_12;
      }
      uint64_t v29 = 0;
      uint64_t v30 = 1;
    }
    [v13 setNotifyOnEntry:v29];
    [v13 setNotifyOnExit:v30];
    goto LABEL_11;
  }
  REEndOfDayForDate();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 endDate:v13];
  [v13 timeIntervalSinceDate:v7];
  v16 = objc_msgSend(v7, "dateByAddingTimeInterval:", fmin(v15, 900.0));
  id v17 = [objc_alloc((Class)REDateRelevanceProvider) initWithEventInterval:v14 becomesIrrelevantDate:v16];
  [v9 addObject:v17];

LABEL_12:
LABEL_13:

  return v9;
}

id REReminderGetAppBundleIdentifier()
{
  return REMAppBundleIdentifier;
}

uint64_t sub_312C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t REEndOfDayForDate()
{
  return _REEndOfDayForDate();
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

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_msgSend_contactLabel(void *a1, const char *a2, ...)
{
  return [a1 contactLabel];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return [a1 radius];
}

id objc_msgSend_referenceFrameString(void *a1, const char *a2, ...)
{
  return [a1 referenceFrameString];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}