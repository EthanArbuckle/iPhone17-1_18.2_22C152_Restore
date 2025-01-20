@interface RoutePlanningTimingFormatter
+ (id)arriveAtStringForDate:(id)a3 timeZone:(id)a4;
+ (id)formattingCalendar;
+ (id)leaveByStringForDate:(id)a3 timeZone:(id)a4;
+ (id)textForTiming:(id)a3;
@end

@implementation RoutePlanningTimingFormatter

+ (id)formattingCalendar
{
  if (qword_10160FFE8 != -1) {
    dispatch_once(&qword_10160FFE8, &stru_1013005B8);
  }
  v2 = (void *)qword_10160FFE0;

  return v2;
}

+ (id)textForTiming:(id)a3
{
  id v4 = a3;
  v5 = [v4 arrivalDate];

  if (v5)
  {
    v6 = [v4 arrivalDate];
    v7 = [v4 arrivalTimeZone];
    uint64_t v8 = [a1 arriveAtStringForDate:v6 timeZone:v7];
LABEL_5:
    v10 = (void *)v8;

    goto LABEL_6;
  }
  v9 = [v4 departureDate];

  if (v9)
  {
    v6 = [v4 departureDate];
    v7 = [v4 departureTimeZone];
    uint64_t v8 = [a1 leaveByStringForDate:v6 timeZone:v7];
    goto LABEL_5;
  }
  v6 = +[NSBundle mainBundle];
  v10 = [v6 localizedStringForKey:@"[RoutePlanning][Timing] Now" value:@"localized string not found" table:0];
LABEL_6:

  return v10;
}

+ (id)arriveAtStringForDate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 formattingCalendar];
  if ((objc_msgSend(v8, "_navigation_isDateInToday:inTimeZone:", v6, v7) & 1) != 0
    || ([v6 timeIntervalSinceNow], v9 < 43200.0))
  {
    v10 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v6 inTimeZone:v7 canIncludeDate:0 suppressTimeZoneDisplay:1 useShortFormat:0];
    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"[RoutePlanning][Timing] Arrive by" value:@"localized string not found" table:0];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);
  }
  else
  {
    v14 = objc_opt_new();
    v10 = [v8 dateByAddingUnit:16 value:5 toDate:v14 options:0];

    v15 = [v8 _navigation_offsetDate:v6 toTimeZone:v7];
    id v16 = [v15 compare:v10];

    v11 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v6 inTimeZone:v7 canIncludeDate:0 suppressTimeZoneDisplay:1 useShortFormat:0];
    v17 = [v8 _navigation_offsetDate:v6 toTimeZone:v7];
    if (v16 == (id)-1)
    {
      v12 = +[NSDateFormatter _maps_weekdayForDate:v17];

      v18 = +[NSBundle mainBundle];
      v19 = v18;
      CFStringRef v20 = @"[RoutePlanning][Timing] Arrive by this week";
    }
    else
    {
      v12 = +[NSDateFormatter _maps_numericMonthDayString:v17];

      v18 = +[NSBundle mainBundle];
      v19 = v18;
      CFStringRef v20 = @"[RoutePlanning][Timing] Arrive by after this week";
    }
    v21 = [v18 localizedStringForKey:v20 value:@"localized string not found" table:0];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v12, v11);
  }

  return v13;
}

+ (id)leaveByStringForDate:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 formattingCalendar];
  if ((objc_msgSend(v8, "_navigation_isDateInToday:inTimeZone:", v6, v7) & 1) != 0
    || ([v6 timeIntervalSinceNow], v9 < 43200.0))
  {
    v10 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v6 inTimeZone:v7 canIncludeDate:0 suppressTimeZoneDisplay:1 useShortFormat:0];
    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"[RoutePlanning][Timing] Leave at" value:@"localized string not found" table:0];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10);
  }
  else
  {
    v14 = objc_opt_new();
    v10 = [v8 dateByAddingUnit:16 value:5 toDate:v14 options:0];

    v15 = [v8 _navigation_offsetDate:v6 toTimeZone:v7];
    id v16 = [v15 compare:v10];

    v11 = +[NSDateFormatter _navigation_localizedTimestampStringForDepartureArrivalDate:v6 inTimeZone:v7 canIncludeDate:0 suppressTimeZoneDisplay:1 useShortFormat:0];
    v17 = [v8 _navigation_offsetDate:v6 toTimeZone:v7];
    if (v16 == (id)-1)
    {
      v12 = +[NSDateFormatter _maps_weekdayForDate:v17];

      v18 = +[NSBundle mainBundle];
      v19 = v18;
      CFStringRef v20 = @"[RoutePlanning][Timing] Leave at this week";
    }
    else
    {
      v12 = +[NSDateFormatter _maps_numericMonthDayString:v17];

      v18 = +[NSBundle mainBundle];
      v19 = v18;
      CFStringRef v20 = @"[RoutePlanning][Timing] Leave at after this week";
    }
    v21 = [v18 localizedStringForKey:v20 value:@"localized string not found" table:0];
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v12, v11);
  }

  return v13;
}

@end