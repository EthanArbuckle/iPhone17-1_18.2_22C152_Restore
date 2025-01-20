@interface CHListAndDetailViewDateFormatter
+ (id)_dayDateFormatter;
+ (id)_todayDateFormatter;
+ (id)detailViewDateFormatter;
+ (id)formattedListStringForDate:(id)a3 font:(id)a4;
+ (id)listViewDateFormatter;
+ (id)timeDateFormatter;
@end

@implementation CHListAndDetailViewDateFormatter

+ (id)listViewDateFormatter
{
  if (qword_10096B4F8 != -1) {
    dispatch_once(&qword_10096B4F8, &stru_1008AD760);
  }
  v2 = (void *)qword_10096B4F0;

  return v2;
}

+ (id)detailViewDateFormatter
{
  if (qword_10096B508 != -1) {
    dispatch_once(&qword_10096B508, &stru_1008AD780);
  }
  v2 = (void *)qword_10096B500;

  return v2;
}

+ (id)timeDateFormatter
{
  if (qword_10096B518 != -1) {
    dispatch_once(&qword_10096B518, &stru_1008AD7A0);
  }
  v2 = (void *)qword_10096B510;

  return v2;
}

+ (id)_todayDateFormatter
{
  if (qword_10096B528 != -1) {
    dispatch_once(&qword_10096B528, &stru_1008AD7C0);
  }
  v2 = (void *)qword_10096B520;

  return v2;
}

+ (id)_dayDateFormatter
{
  if (qword_10096B538 != -1) {
    dispatch_once(&qword_10096B538, &stru_1008AD7E0);
  }
  v2 = (void *)qword_10096B530;

  return v2;
}

+ (id)formattedListStringForDate:(id)a3 font:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSCalendar currentCalendar];
  unsigned int v9 = [v8 isDateInToday:v6];

  if (v9)
  {
    _HKInitializeLogging();
    v10 = (void *)HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = +[NSDate date];
      *(_DWORD *)buf = 138543618;
      id v37 = v6;
      __int16 v38 = 2114;
      v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "NSCalendar reported that date %{public}@ is in today %{public}@", buf, 0x16u);
    }
    v13 = [a1 _todayDateFormatter];
    v14 = +[NSCalendar currentCalendar];
    v15 = +[NSDate date];
    v16 = [v14 startOfDayForDate:v15];

    if ([v6 compare:v16] == (id)-1)
    {
      _HKInitializeLogging();
      v17 = HKLogActivity;
      if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v37 = v6;
        __int16 v38 = 2114;
        v39 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Found date:%{public}@ to be before the start of today:%{public}@", buf, 0x16u);
      }
      uint64_t v18 = [(id)objc_opt_class() _dayDateFormatter];

      v13 = (void *)v18;
    }
    v19 = [v13 stringFromDate:v6];
    _HKInitializeLogging();
    v20 = HKLogActivity;
    if (os_log_type_enabled(HKLogActivity, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v37 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "List view date string: %@", buf, 0xCu);
    }
  }
  else
  {
    id v21 = v6;
    v22 = +[NSCalendar currentCalendar];
    v23 = +[NSDate date];
    v24 = [v22 dateByAddingUnit:16 value:-6 toDate:v23 options:0];

    v25 = +[NSCalendar currentCalendar];
    v26 = [v25 startOfDayForDate:v24];

    id v27 = [v21 laterDate:v26];

    if (v27 == v21)
    {
      v28 = [a1 _dayDateFormatter];
      v19 = [v28 stringFromDate:v21];
    }
    else
    {
      v28 = [a1 listViewDateFormatter];
      v29 = [v28 stringFromDate:v21];
      v19 = [v29 localizedUppercaseString];
    }
  }
  id v30 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v34 = NSFontAttributeName;
  id v35 = v7;
  v31 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v32 = [v30 initWithString:v19 attributes:v31];

  return v32;
}

@end