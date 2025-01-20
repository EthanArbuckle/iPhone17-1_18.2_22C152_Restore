@interface FMFSchedule
+ (id)_dateFromHour:(unint64_t)a3 andMinute:(unint64_t)a4;
+ (id)_dayStringForDayOfWeek:(int64_t)a3;
+ (id)_stringForDaysOfWeek:(int64_t)a3;
+ (id)localizedDaysOfWeekStringFor:(int64_t)a3;
+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4;
+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4 timeStyle:(unint64_t)a5;
+ (void)_enumerateDaysOfWeekInFMFDaysOfWeek:(int64_t)a3 callback:(id)a4;
- (NSString)localizedDaysOfWeekString;
- (NSString)localizedEndTimeString;
- (NSString)localizedStartTimeString;
@end

@implementation FMFSchedule

+ (id)_dateFromHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  v6 = +[NSDate dateWithTimeIntervalSinceNow:0.0];
  v7 = +[NSCalendar currentCalendar];
  v8 = [v7 components:62 fromDate:v6];
  [v8 setHour:a3];
  [v8 setMinute:a4];
  v9 = [v7 dateFromComponents:v8];

  return v9;
}

+ (void)_enumerateDaysOfWeekInFMFDaysOfWeek:(int64_t)a3 callback:(id)a4
{
  v12 = (void (**)(void))a4;
  v5 = +[NSCalendar currentCalendar];
  id v6 = [v5 firstWeekday];
  uint64_t v7 = 0;
  uint64_t v8 = (((unint64_t)v6 + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  unint64_t v9 = (unint64_t)v6 - 7 * ((v8 + (((unint64_t)v6 + 6 - v8) >> 1)) >> 2) + 6;
  unint64_t v10 = v9;
  do
  {
    if (v10 > 6) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_10007E810[v10];
    }
    if ((v11 & a3) != 0) {
      v12[2]();
    }
    if (v10 < 6) {
      ++v10;
    }
    else {
      unint64_t v10 = 0;
    }
    ++v7;
  }
  while (v10 != v9);
}

+ (id)_dayStringForDayOfWeek:(int64_t)a3
{
  v4 = +[NSCalendar currentCalendar];
  v5 = v4;
  id v6 = &stru_1000A3938;
  if (a3 > 15)
  {
    switch(a3)
    {
      case 16:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 2;
        break;
      case 32:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 1;
        break;
      case 64:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 0;
        break;
      default:
        goto LABEL_14;
    }
LABEL_13:
    id v6 = [v7 objectAtIndexedSubscript:v9];
  }
  else
  {
    switch(a3)
    {
      case 1:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 6;
        goto LABEL_13;
      case 2:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 5;
        goto LABEL_13;
      case 4:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 4;
        goto LABEL_13;
      case 8:
        uint64_t v7 = [v4 weekdaySymbols];
        uint64_t v8 = v7;
        uint64_t v9 = 3;
        goto LABEL_13;
      default:
        break;
    }
  }
LABEL_14:

  return v6;
}

+ (id)_stringForDaysOfWeek:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 127)
    {
      v4 = +[NSBundle bundleForClass:objc_opt_class()];
      v5 = [v4 localizedStringForKey:@"DAYSLIST_EVERY_DAY" value:&stru_1000A3938 table:@"Localizable-TINKER"];
    }
    else
    {
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v30[3] = 0x7FFFFFFFFFFFFFFFLL;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      v29[3] = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 1;
      v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      v18 = sub_100019AF0;
      v19 = &unk_1000A1F08;
      id v24 = a1;
      id v6 = (id)objc_opt_new();
      id v20 = v6;
      v21 = v30;
      v22 = v29;
      v23 = &v25;
      [v24 _enumerateDaysOfWeekInFMFDaysOfWeek:a3 callback:&v16];
      switch((unint64_t)[v6 count])
      {
        case 1uLL:
          uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
          uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_1" value:&stru_1000A3938 table:@"Localizable-TINKER"];
          uint64_t v9 = [v6 objectAtIndexedSubscript:0];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_32;
        case 2uLL:
          if (*((unsigned char *)v26 + 24))
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            [v7 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_2" value:&stru_1000A3938 table:@"Localizable-TINKER"];
          }
          else
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            [v7 localizedStringForKey:@"DAYSLIST_2" value:&stru_1000A3938 table:@"Localizable-TINKER"];
          uint64_t v8 = };
          uint64_t v9 = [v6 objectAtIndexedSubscript:0];
          unint64_t v10 = [v6 objectAtIndexedSubscript:1];
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v10);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        case 3uLL:
          if (*((unsigned char *)v26 + 24))
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_3" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:2];
            [v6 objectAtIndexedSubscript:1];
          }
          else
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_3" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:1];
            [v6 objectAtIndexedSubscript:2];
          uint64_t v11 = };
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v10, v11);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        case 4uLL:
          if (*((unsigned char *)v26 + 24))
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_4" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:3];
            uint64_t v11 = [v6 objectAtIndexedSubscript:1];
            [v6 objectAtIndexedSubscript:2];
          }
          else
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_4" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:1];
            uint64_t v11 = [v6 objectAtIndexedSubscript:2];
            [v6 objectAtIndexedSubscript:3];
          v12 = };
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v10, v11, v12);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 5uLL:
          if (*((unsigned char *)v26 + 24))
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_5" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:4];
            uint64_t v11 = [v6 objectAtIndexedSubscript:1];
            v12 = [v6 objectAtIndexedSubscript:2];
            [v6 objectAtIndexedSubscript:3];
          }
          else
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_5" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:1];
            uint64_t v11 = [v6 objectAtIndexedSubscript:2];
            v12 = [v6 objectAtIndexedSubscript:3];
            [v6 objectAtIndexedSubscript:4];
          v13 = };
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v10, v11, v12, v13);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_28;
        case 6uLL:
          if (*((unsigned char *)v26 + 24))
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_CONTIGUOUS_6" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:5];
            uint64_t v11 = [v6 objectAtIndexedSubscript:1];
            v12 = [v6 objectAtIndexedSubscript:2];
            v13 = [v6 objectAtIndexedSubscript:3];
            [v6 objectAtIndexedSubscript:4];
          }
          else
          {
            uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
            uint64_t v8 = [v7 localizedStringForKey:@"DAYSLIST_6" value:&stru_1000A3938 table:@"Localizable-TINKER"];
            uint64_t v9 = [v6 objectAtIndexedSubscript:0];
            unint64_t v10 = [v6 objectAtIndexedSubscript:1];
            uint64_t v11 = [v6 objectAtIndexedSubscript:2];
            v12 = [v6 objectAtIndexedSubscript:3];
            v13 = [v6 objectAtIndexedSubscript:4];
            [v6 objectAtIndexedSubscript:5];
          v14 = };
          +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_28:
LABEL_29:

LABEL_30:
LABEL_31:

LABEL_32:
          break;
        default:
          v5 = &stru_1000A3938;
          break;
      }

      _Block_object_dispose(&v25, 8);
      _Block_object_dispose(v29, 8);
      _Block_object_dispose(v30, 8);
    }
  }
  else
  {
    v5 = &stru_1000A3938;
  }

  return v5;
}

+ (id)localizedDaysOfWeekStringFor:(int64_t)a3
{
  return +[FMFSchedule _stringForDaysOfWeek:a3];
}

- (NSString)localizedDaysOfWeekString
{
  id v2 = [(FMFSchedule *)self daysOfWeek];

  return (NSString *)+[FMFSchedule localizedDaysOfWeekStringFor:v2];
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4 timeStyle:(unint64_t)a5
{
  id v6 = +[FMFSchedule _dateFromHour:a3 andMinute:a4];
  if (v6)
  {
    uint64_t v7 = +[NSDateFormatter localizedStringFromDate:v6 dateStyle:0 timeStyle:a5];
  }
  else
  {
    uint64_t v7 = &stru_1000A3938;
  }

  return v7;
}

+ (id)localizedTimeStringForHour:(unint64_t)a3 andMinute:(unint64_t)a4
{
  return +[FMFSchedule localizedTimeStringForHour:a3 andMinute:a4 timeStyle:1];
}

- (NSString)localizedStartTimeString
{
  id v3 = [(FMFSchedule *)self startHour];
  id v4 = [(FMFSchedule *)self startMin];

  return (NSString *)+[FMFSchedule localizedTimeStringForHour:v3 andMinute:v4];
}

- (NSString)localizedEndTimeString
{
  id v3 = [(FMFSchedule *)self endHour];
  id v4 = [(FMFSchedule *)self endMin];

  return (NSString *)+[FMFSchedule localizedTimeStringForHour:v3 andMinute:v4];
}

@end