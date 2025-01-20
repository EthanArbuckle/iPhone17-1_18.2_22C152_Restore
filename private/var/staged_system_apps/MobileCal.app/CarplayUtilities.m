@interface CarplayUtilities
+ (BOOL)eventCanDialIn:(id)a3;
+ (BOOL)eventCanNavigate:(id)a3;
+ (id)dateForSection:(int64_t)a3;
+ (int64_t)numberOfLinesInString:(id)a3;
@end

@implementation CarplayUtilities

+ (BOOL)eventCanNavigate:(id)a3
{
  v3 = +[EKMapsUtilities mapsURLForLocation:0 onEvent:a3 hasMapItemLaunchOptionFromTimeToLeaveNotification:0];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)eventCanDialIn:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 virtualConference];
  v5 = [v4 joinMethods];
  v6 = [v5 firstObject];
  v7 = [v6 URL];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v3 conferenceURLForDisplay];
  }
  v10 = v9;

  v11 = [v10 absoluteString];
  id v12 = [v11 length];

  if (v12)
  {
    if (objc_msgSend(v10, "cal_hasSchemeTel"))
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      v13 = +[EKConferenceUtils applicationRecordForURL:v10 incomplete:0];
      v14 = [v13 bundleIdentifier];

      if ([v14 length])
      {
        uint64_t v21 = 0;
        v15 = +[FBSOpenApplicationService dashboardService];
        LOBYTE(v12) = [v15 canOpenApplication:v14 reason:&v21];

        if ((v12 & 1) == 0)
        {
          v16 = (void *)kCalUILogCarplayHandle;
          if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = v21;
            v18 = v16;
            v19 = +[NSNumber numberWithInteger:v17];
            *(_DWORD *)buf = 138412546;
            v23 = v10;
            __int16 v24 = 2112;
            v25 = v19;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Couldn't open URL %@ in CarPlay, so not including tappable cell for it: %@", buf, 0x16u);
          }
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
  }

  return (char)v12;
}

+ (int64_t)numberOfLinesInString:(id)a3
{
  if (!a3) {
    return 1;
  }
  uint64_t v8 = 0;
  id v3 = a3;
  BOOL v4 = +[NSRegularExpression regularExpressionWithPattern:@"\n" options:0 error:&v8];
  id v5 = [v4 numberOfMatchesInString:v3 options:0 range:[v3 length]];

  int64_t v6 = (int64_t)v5 + 1;
  return v6;
}

+ (id)dateForSection:(int64_t)a3
{
  BOOL v4 = CUIKNowDate();
  id v5 = v4;
  if (a3)
  {
    int64_t v6 = +[NSCalendar currentCalendar];
    v7 = (void *)CalCopyTimeZone();
    [v6 setTimeZone:v7];

    id v8 = [v6 dateByAddingUnit:16 value:1 toDate:v5 options:0];
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

@end