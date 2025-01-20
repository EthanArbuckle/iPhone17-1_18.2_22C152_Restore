@interface SMSafetyMonitorUtilities
+ (NSString)magnetBreakNotificationMessage;
+ (NSString)magnetBreakNotificationTitle;
+ (NSString)workoutAlwaysPromptActionTitle;
+ (NSString)workoutAlwaysPromptBody;
+ (id)carPlayGroupFallbackName;
+ (id)carPlayNotificationTypeToString:(unint64_t)a3;
+ (id)disabledConnectivityAlertDestinationMessage;
+ (id)disabledConnectivityAlertGenericMessage;
+ (id)disabledConnectivityAlertOKButton;
+ (id)disabledConnectivityAlertTitle;
+ (id)getCarPlayButtonActionIdentifierForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5;
+ (id)getCarPlayButtonTitleForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5;
+ (id)getCarPlayNotificationCategoryForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5;
+ (id)getCarPlayNotificationMessageForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 contactName:(id)a5 cacheReleaseDate:(id)a6 error:(id *)a7;
+ (id)getCarPlayNotificationTitleForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 contactName:(id)a5 error:(id *)a6;
+ (id)getSuggestionBodyWithPlaceInference:(id)a3;
+ (id)getSuggestionFooter;
+ (id)getSuggestionTitleWithContactName:(id)a3;
+ (id)getSuggestionTitleWithoutContactName;
+ (id)safeArrivalMessageWithCustomizedSummaryForDestination:(id)a3;
@end

@implementation SMSafetyMonitorUtilities

+ (id)carPlayNotificationTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"SMCarPlayNotificationTypeUnknown";
  }
  else {
    return off_265499860[a3 - 1];
  }
}

+ (NSString)magnetBreakNotificationTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"MAGNET_BREAK_NOTIFICATION_TITLE" value:@"Check In" table:0];

  return (NSString *)v3;
}

+ (NSString)magnetBreakNotificationMessage
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"MAGNET_BREAK_NOTIFICATION_MESSAGE" value:@"Apple Watch is no longer connected to iPhone. Check In will continue on iPhone." table:0];

  return (NSString *)v3;
}

+ (id)getCarPlayNotificationTitleForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 contactName:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  if (v10)
  {
    uint64_t v28 = *MEMORY[0x263F08320];
    v11 = NSString;
    v12 = NSStringFromSelector(a2);
    v13 = [(id)objc_opt_class() carPlayNotificationTypeToString:a3];
    v14 = +[SMSessionConfiguration sessionTypeToString:a4];
    v15 = [v11 stringWithFormat:@"%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@, contactName, %@,", v12, v13, v14, v10];
    v29[0] = v15;
    v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];

    if (a3 - 1 > 3)
    {
      if (a3 == 5)
      {
        v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = [v23 localizedStringForKey:@"CARPLAY_NOTIFICATION_TITLE_CACHE_RELEASED" value:@"%@ has been notified." table:0];

        uint64_t v24 = [NSString localizedStringWithValidatedFormat:v18, @"%@", 0, v10 validFormatSpecifiers error];
        goto LABEL_17;
      }
    }
    else
    {
      if (a4 == 1)
      {
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"CARPLAY_NOTIFICATION_TITLE_TIMER_SESSION_ANOMALY";
        v20 = @"Your timer has ended.";
        goto LABEL_16;
      }
      if (a4 == 2)
      {
        v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v18 = v17;
        v19 = @"CARPLAY_NOTIFICATION_TITLE_DESTINATION_SESSION_ANOMALY";
        v20 = @"It looks like you’re delayed.";
LABEL_16:
        uint64_t v24 = [v17 localizedStringForKey:v19 value:v20 table:0];
LABEL_17:
        v22 = (void *)v24;

        v25 = 0;
        if (!a6)
        {
LABEL_19:

          goto LABEL_20;
        }
LABEL_18:
        *a6 = v25;
        goto LABEL_19;
      }
    }
    v25 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SMErrorDomain" code:7 userInfo:v16];
    v22 = 0;
    if (!a6) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactName", buf, 2u);
  }

  if (a6)
  {
    _RTErrorInvalidParameterCreate(@"contactName");
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_20:

  return v22;
}

+ (id)getCarPlayNotificationMessageForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 contactName:(id)a5 cacheReleaseDate:(id)a6 error:(id *)a7
{
  v32[1] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  if (v12)
  {
    uint64_t v31 = *MEMORY[0x263F08320];
    v14 = NSString;
    v15 = NSStringFromSelector(a2);
    v16 = [(id)objc_opt_class() carPlayNotificationTypeToString:a3];
    v17 = +[SMSessionConfiguration sessionTypeToString:a4];
    v18 = [v14 stringWithFormat:@"%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@, contactName, %@,", v15, v16, v17, v12];
    v32[0] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];

    if (a3 - 1 > 3)
    {
      if (a3 == 5)
      {
        v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v25 = [v27 localizedStringForKey:@"CARPLAY_NOTIFICATION_MESSAGE_CACHE_RELEASED" value:@"Your location is being shared." table:0];

LABEL_11:
        uint64_t v28 = 0;
        if (!a7) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    else if (a4 - 1 <= 1)
    {
      v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v21 = [v20 localizedStringForKey:@"CARPLAY_NOTIFICATION_MESSAGE_SESSION_ANOMALY" value:@"%@ will be notified in %lu min." table:0];

      v22 = NSString;
      v23 = [MEMORY[0x263EFF910] date];
      [v13 timeIntervalSinceDate:v23];
      *(float *)&double v24 = v24 / 60.0;
      v25 = [v22 localizedStringWithValidatedFormat:v21, @"%@%lu", 0, v12, vcvtas_u32_f32(*(float *)&v24) validFormatSpecifiers error];

      goto LABEL_11;
    }
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SMErrorDomain" code:7 userInfo:v19];
    v25 = 0;
    if (!a7)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:
    *a7 = v28;
    goto LABEL_15;
  }
  v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_25B6E0000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactName", buf, 2u);
  }

  if (a7)
  {
    _RTErrorInvalidParameterCreate(@"contactName");
    v25 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
LABEL_16:

  return v25;
}

+ (id)getCarPlayNotificationCategoryForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F08320];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  id v10 = [(id)objc_opt_class() carPlayNotificationTypeToString:a3];
  v11 = +[SMSessionConfiguration sessionTypeToString:a4];
  id v12 = [v8 stringWithFormat:@"%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@,", v9, v10, v11, v19];
  v20[0] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  if (a3 - 1 > 3)
  {
    if (a3 == 5)
    {
      v15 = @"CacheReleaseTimedOut";
      goto LABEL_15;
    }
    v16 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SMErrorDomain" code:7 userInfo:v13];
    v17 = 0;
    if (a5) {
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (a4 == 1)
  {
    v14 = SMTimerEndedNotificationCategory;
    goto LABEL_10;
  }
  if (a4 == 2)
  {
    v14 = SMDestinationAnomalyNotificationCategory;
LABEL_10:
    v17 = *v14;
    goto LABEL_12;
  }
  v17 = 0;
LABEL_12:
  v16 = 0;
  if (a5) {
LABEL_13:
  }
    *a5 = v16;
LABEL_14:
  v15 = v17;

LABEL_15:
  return v15;
}

+ (id)getCarPlayButtonActionIdentifierForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v19 = *MEMORY[0x263F08320];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  id v10 = [(id)objc_opt_class() carPlayNotificationTypeToString:a3];
  v11 = +[SMSessionConfiguration sessionTypeToString:a4];
  id v12 = [v8 stringWithFormat:@"%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@,", v9, v10, v11, v19];
  v20[0] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  if (a3 - 1 > 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
    {
      v15 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SMErrorDomain" code:7 userInfo:v13];
      goto LABEL_13;
    }
    v14 = SMCarPlayActionIdentifierOK;
  }
  else
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        v14 = SMCarPlayActionIdentifierExtendDestinationSession;
        goto LABEL_9;
      }
      v15 = 0;
LABEL_13:
      v16 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    v14 = SMCarPlayActionIdentifierExtendTimerSession;
  }
LABEL_9:
  v16 = *v14;
  v15 = 0;
  if (a5) {
LABEL_10:
  }
    *a5 = v15;
LABEL_11:
  v17 = v16;

  return v17;
}

+ (id)getCarPlayButtonTitleForNotificationType:(unint64_t)a3 sessionType:(unint64_t)a4 error:(id *)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  uint64_t v22 = *MEMORY[0x263F08320];
  v8 = NSString;
  v9 = NSStringFromSelector(a2);
  id v10 = [(id)objc_opt_class() carPlayNotificationTypeToString:a3];
  v11 = +[SMSessionConfiguration sessionTypeToString:a4];
  id v12 = [v8 stringWithFormat:@"%@ invalid options passed, carPlayNotificationType, %@, sessionType, %@,", v9, v10, v11, v22];
  v23[0] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];

  if (a3 - 1 > 2)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
    {
      v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"SMErrorDomain" code:7 userInfo:v13];
      goto LABEL_13;
    }
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v14;
    v16 = @"CARPLAY_NOTIFICATION_BUTTON_TITLE_CACHE_RELEASED";
    v17 = @"OK";
  }
  else
  {
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v15 = v14;
        v16 = @"CARPLAY_NOTIFICATION_BUTTON_TITLE_DESTINATION_SESSION_ANOMALY";
        v17 = @"Add Time";
        goto LABEL_9;
      }
      v18 = 0;
LABEL_13:
      uint64_t v19 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v15 = v14;
    v16 = @"CARPLAY_NOTIFICATION_BUTTON_TITLE_TIMER_SESSION_ANOMALY";
    v17 = @"Add 30 min";
  }
LABEL_9:
  uint64_t v19 = [v14 localizedStringForKey:v16 value:v17 table:0];

  v18 = 0;
  if (a5) {
LABEL_10:
  }
    *a5 = v18;
LABEL_11:
  id v20 = v19;

  return v20;
}

+ (id)safeArrivalMessageWithCustomizedSummaryForDestination:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"END_MESSAGE_SAFE_ARRIVAL_CUSTOMISED_DESTINATION_SUMMARY" value:@"Check In: Arrived at %@" table:0];

  v7 = [NSString localizedStringWithValidatedFormat:v6, @"%@", 0, v4 validFormatSpecifiers error];

  return v7;
}

+ (id)carPlayGroupFallbackName
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"group" value:@"group" table:0];

  return v3;
}

+ (id)getSuggestionTitleWithoutContactName
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SUGGESTION_NOTIFICATION_TITLE_NO_CONTACT" value:@"Start a Check In with a friend" table:0];

  return v3;
}

+ (id)getSuggestionTitleWithContactName:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"SUGGESTION_NOTIFICATION_TITLE" value:@"Start a Check In with %@" table:0];

  v7 = [NSString localizedStringWithValidatedFormat:v6, @"%@", 0, v4 validFormatSpecifiers error];

  return v7;
}

+ (id)getSuggestionBodyWithPlaceInference:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 localizedStringForKey:@"SUGGESTION_NOTIFICATION_BODY" value:@"Let them know when you arrive at %@" table:0];

    v7 = [NSString localizedStringWithValidatedFormat:v6, @"%@", 0, v3 validFormatSpecifiers error];
    v5 = (void *)v6;
  }
  else
  {
    v7 = [v4 localizedStringForKey:@"SUGGESTION_NOTIFICATION_BODY_FALLBACK" value:@"Let them know when you arrive at your destination" table:0];
  }

  return v7;
}

+ (id)getSuggestionFooter
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"SUGGESTION_NOTIFICATION_FOOTER" value:@"Siri Suggestion" table:0];

  return v3;
}

+ (NSString)workoutAlwaysPromptBody
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Would you like to be reminded to Check In when starting an outdoor workout? You can customize this in Settings." value:&stru_27090E290 table:0];

  return (NSString *)v3;
}

+ (NSString)workoutAlwaysPromptActionTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Remind Me" value:&stru_27090E290 table:0];

  return (NSString *)v3;
}

+ (id)disabledConnectivityAlertTitle
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Check In" value:&stru_27090E290 table:0];

  return v3;
}

+ (id)disabledConnectivityAlertOKButton
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"OK" value:&stru_27090E290 table:0];

  return v3;
}

+ (id)disabledConnectivityAlertGenericMessage
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Check In requires a cellular connection to respond when prompted. If a network connection is not available, your friend will be notified.", &stru_27090E290, 0 value table];

  return v3;
}

+ (id)disabledConnectivityAlertDestinationMessage
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"Check In requires a cellular connection to keep up with your progress. If Check In cannot determine that you’ve arrived by your original ETA, your friend will be notified.", &stru_27090E290, 0 value table];

  return v3;
}

@end