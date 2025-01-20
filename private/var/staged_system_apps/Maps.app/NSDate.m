@interface NSDate
+ (id)_maps_dateDescriptionShort:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5;
+ (id)_maps_dayDescriptionStringShortDescription:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5;
+ (id)_maps_maximumDateForRoutePlanning;
+ (id)_maps_minimumDateForRoutePlanningWithTimeZone:(id)a3;
- (id)_maps_nextDayAtHour:(int64_t)a3 timeZone:(id)a4;
- (id)_maps_nextWeekday:(int64_t)a3 atHour:(int64_t)a4 timeZone:(id)a5;
@end

@implementation NSDate

- (id)_maps_nextDayAtHour:(int64_t)a3 timeZone:(id)a4
{
  id v6 = a4;
  v7 = sub_100105D60();
  v8 = v7;
  if (v6) {
    [v7 setTimeZone:v6];
  }
  v9 = [v8 components:28 fromDate:self];
  [v9 setHour:a3];
  v10 = [v8 dateFromComponents:v9];
  id v11 = objc_alloc_init((Class)NSDateComponents);
  [v11 setDay:1];
  v12 = [v8 dateByAddingComponents:v11 toDate:v10 options:0];

  return v12;
}

+ (id)_maps_dateDescriptionShort:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  if (qword_10160FFB0 != -1) {
    dispatch_once(&qword_10160FFB0, &stru_101300578);
  }
  [(id)qword_10160FFA8 setTimeZone:v7];
  v9 = +[NSDate _maps_dayDescriptionStringShortDescription:v6 timeZone:v7 bookingDate:v8];
  v10 = [(id)qword_10160FFA8 stringFromDate:v8];
  id v11 = +[NSCalendar currentCalendar];
  v12 = [v11 componentsInTimeZone:v7 fromDate:v8];

  if ([v12 hour] == (id)1)
  {
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  id v13 = [v12 hour];
  if (v6)
  {
    if (v13 != (id)13)
    {
      block = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      v23 = sub_100900170;
      v24 = &unk_1012E63F0;
      v25 = "NSDate+RestaurantReservationDescriptionHelper";
      if (qword_10160FFD0 != -1) {
        dispatch_once(&qword_10160FFD0, &block);
      }
      v14 = (void *)qword_10160FFC8;
      CFStringRef v15 = @"reservation_date_at_time_key_not_at_1";
      goto LABEL_17;
    }
LABEL_8:
    block = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    v23 = sub_100900170;
    v24 = &unk_1012E63F0;
    v25 = "NSDate+RestaurantReservationDescriptionHelper";
    if (qword_10160FFD0 != -1) {
      dispatch_once(&qword_10160FFD0, &block);
    }
    v14 = (void *)qword_10160FFC8;
    CFStringRef v15 = @"reservation_date_at_time_key_at_1";
LABEL_17:
    CFStringRef v16 = @"%1$@ at %2$@<unlocalized>";
    goto LABEL_18;
  }
LABEL_11:
  block = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100900170;
  v24 = &unk_1012E63F0;
  v25 = "NSDate+RestaurantReservationDescriptionHelper";
  if (qword_10160FFD0 != -1) {
    dispatch_once(&qword_10160FFD0, &block);
  }
  v14 = (void *)qword_10160FFC8;
  CFStringRef v15 = @"reservation_date_at_time_short_key";
  CFStringRef v16 = @"%1$@, %2$@<unlocalized>";
LABEL_18:
  v17 = [v14 localizedStringForKey:v15 value:v16 table:0];
  v18 = MapsSuggestionsNonNilString();

  id v19 = [objc_alloc((Class)NSString) initWithFormat:v18, v9, v10];

  return v19;
}

+ (id)_maps_dayDescriptionStringShortDescription:(BOOL)a3 timeZone:(id)a4 bookingDate:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = a5;
  BOOL v37 = v6;
  if (qword_10160FFC0 != -1) {
    dispatch_once(&qword_10160FFC0, &stru_101300598);
  }
  [(id)qword_10160FFB8 setDateStyle:0];
  [(id)qword_10160FFB8 setTimeStyle:1];
  [(id)qword_10160FFB8 setTimeZone:v7];
  v9 = +[NSCalendar currentCalendar];
  v10 = +[NSDate date];
  id v11 = [v9 componentsInTimeZone:v7 fromDate:v10];

  v12 = [v9 componentsInTimeZone:v7 fromDate:v8];
  id v13 = [v11 year];
  if (v13 == [v12 year] && (id v14 = objc_msgSend(v11, "month"), v14 == objc_msgSend(v12, "month")))
  {
    id v15 = [v11 day];
    BOOL v16 = v15 == [v12 day];
  }
  else
  {
    BOOL v16 = 0;
  }
  id v17 = [v11 year];
  if (v17 != [v12 year])
  {
    BOOL v19 = 0;
    if (!v16) {
      goto LABEL_9;
    }
LABEL_11:
    BOOL v20 = (uint64_t)[v12 hour] > 16;
    goto LABEL_12;
  }
  id v18 = [v11 weekOfYear];
  BOOL v19 = v18 == [v12 weekOfYear];
  if (v16) {
    goto LABEL_11;
  }
LABEL_9:
  BOOL v20 = 0;
LABEL_12:
  id v21 = [v11 copy];
  [v21 setDay:[v21 day] + 1];
  id v22 = [v21 year];
  if (v22 == [v12 year])
  {
    id v23 = [v21 month];
    if (v23 == [v12 month])
    {
      id v24 = [v21 day];
      BOOL v25 = v24 == [v12 day];
      if (!v20) {
        goto LABEL_15;
      }
LABEL_20:
      block = _NSConcreteStackBlock;
      uint64_t v39 = 3221225472;
      v40 = sub_100900170;
      v41 = &unk_1012E63F0;
      v42 = "NSDate+RestaurantReservationDescriptionHelper";
      if (qword_10160FFD0 != -1) {
        dispatch_once(&qword_10160FFD0, &block);
      }
      v26 = v8;
      v27 = (void *)qword_10160FFC8;
      CFStringRef v28 = @"reservation_tonight_key";
      CFStringRef v29 = @"Tonight<unlocalized>";
      goto LABEL_27;
    }
  }
  BOOL v25 = 0;
  if (v20) {
    goto LABEL_20;
  }
LABEL_15:
  if (v16)
  {
    block = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472;
    v40 = sub_100900170;
    v41 = &unk_1012E63F0;
    v42 = "NSDate+RestaurantReservationDescriptionHelper";
    v26 = v8;
    if (qword_10160FFD0 != -1) {
      dispatch_once(&qword_10160FFD0, &block);
    }
    v27 = (void *)qword_10160FFC8;
    CFStringRef v28 = @"reservation_today_key";
    CFStringRef v29 = @"Today<unlocalized>";
LABEL_27:
    v30 = [v27 localizedStringForKey:v28 value:v29 table:0];
    v31 = MapsSuggestionsNonNilString();

    goto LABEL_28;
  }
  v26 = v8;
  if (v25)
  {
    block = _NSConcreteStackBlock;
    uint64_t v39 = 3221225472;
    v40 = sub_100900170;
    v41 = &unk_1012E63F0;
    v42 = "NSDate+RestaurantReservationDescriptionHelper";
    if (qword_10160FFD0 != -1) {
      dispatch_once(&qword_10160FFD0, &block);
    }
    v27 = (void *)qword_10160FFC8;
    CFStringRef v28 = @"reservation_tomorrow_key";
    CFStringRef v29 = @"Tomorrow<unlocalized>";
    goto LABEL_27;
  }
  if (v19)
  {
    if (v37) {
      CFStringRef v33 = @"EE";
    }
    else {
      CFStringRef v33 = @"EEEE";
    }
    [(id)qword_10160FFB8 setDateFormat:v33];
    v34 = (void *)qword_10160FFB8;
  }
  else
  {
    if (v37)
    {
      v35 = +[NSLocale currentLocale];
      v36 = +[NSDateFormatter dateFormatFromTemplate:@"MMMdd" options:0 locale:v35];

      [(id)qword_10160FFB8 setDateFormat:v36];
    }
    else
    {
      [(id)qword_10160FFB8 setDateStyle:2];
      [(id)qword_10160FFB8 setTimeStyle:0];
    }
    v34 = (void *)qword_10160FFB8;
  }
  v31 = [v34 stringFromDate:v8];
LABEL_28:

  return v31;
}

+ (id)_maps_minimumDateForRoutePlanningWithTimeZone:(id)a3
{
  id v4 = a3;
  v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 copy];

  [v6 setTimeZone:v4];
  id v7 = [a1 date];
  id v8 = [v6 startOfDayForDate:v7];
  [v7 timeIntervalSinceDate:v8];
  if (v9 < 14400.0)
  {
    uint64_t v10 = [v6 dateByAddingUnit:16 value:-1 toDate:v8 options:0];

    id v8 = (void *)v10;
  }
  if ([v8 compare:v7] == (id)-1) {
    id v11 = v8;
  }
  else {
    id v11 = v7;
  }
  id v12 = v11;

  return v12;
}

+ (id)_maps_maximumDateForRoutePlanning
{
  v2 = [a1 date];
  GEOConfigGetDouble();
  v3 = [v2 dateByAddingTimeInterval:];

  return v3;
}

- (id)_maps_nextWeekday:(int64_t)a3 atHour:(int64_t)a4 timeZone:(id)a5
{
  id v8 = a5;
  double v9 = sub_100105D60();
  uint64_t v10 = v9;
  if (v8) {
    [v9 setTimeZone:v8];
  }
  id v11 = [v10 components:8748 fromDate:self];
  if ((uint64_t)[v11 weekday] >= a3) {
    [v11 setWeekOfYear:[v11 weekOfYear] + 1];
  }
  [v11 setWeekday:a3];
  [v11 setHour:a4];
  id v12 = [v10 dateFromComponents:v11];

  return v12;
}

@end