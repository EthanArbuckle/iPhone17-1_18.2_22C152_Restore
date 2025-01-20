@interface NSDateFormatter
+ (id)_maps_abbreviatedDateStringWithoutYearForDate:(id)a3;
+ (id)_maps_abbreviatedWeekdayForDate:(id)a3;
+ (id)_maps_dateStringWithoutYearForDate:(id)a3;
+ (id)_maps_numericMonthDayString:(id)a3;
+ (id)_maps_timeForDate:(id)a3;
+ (id)_maps_timeForDate:(id)a3 timeZone:(id)a4;
+ (id)_maps_weekdayForDate:(id)a3;
@end

@implementation NSDateFormatter

+ (id)_maps_timeForDate:(id)a3
{
  uint64_t v3 = qword_10160F448;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F448, &stru_1012F3DD8);
  }
  v5 = [(id)qword_10160F440 stringFromDate:v4];

  return v5;
}

+ (id)_maps_timeForDate:(id)a3 timeZone:(id)a4
{
  uint64_t v5 = qword_10160F458;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_10160F458, &stru_1012F3DF8);
  }
  [(id)qword_10160F450 setTimeZone:v6];

  v8 = [(id)qword_10160F450 stringFromDate:v7];

  return v8;
}

+ (id)_maps_abbreviatedWeekdayForDate:(id)a3
{
  uint64_t v3 = qword_10160F468;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F468, &stru_1012F3E18);
  }
  [(id)qword_10160F460 setLocalizedDateFormatFromTemplate:@"E"];
  uint64_t v5 = [(id)qword_10160F460 stringFromDate:v4];

  return v5;
}

+ (id)_maps_weekdayForDate:(id)a3
{
  uint64_t v3 = qword_10160F478;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F478, &stru_1012F3E38);
  }
  [(id)qword_10160F470 setLocalizedDateFormatFromTemplate:@"EEEE"];
  uint64_t v5 = [(id)qword_10160F470 stringFromDate:v4];

  return v5;
}

+ (id)_maps_dateStringWithoutYearForDate:(id)a3
{
  uint64_t v3 = qword_10160F488;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F488, &stru_1012F3E58);
  }
  [(id)qword_10160F480 setLocalizedDateFormatFromTemplate:@"MMMMd"];
  uint64_t v5 = [(id)qword_10160F480 stringFromDate:v4];

  return v5;
}

+ (id)_maps_abbreviatedDateStringWithoutYearForDate:(id)a3
{
  uint64_t v3 = qword_10160F498;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F498, &stru_1012F3E78);
  }
  [(id)qword_10160F490 setLocalizedDateFormatFromTemplate:@"MMMd"];
  uint64_t v5 = [(id)qword_10160F490 stringFromDate:v4];

  return v5;
}

+ (id)_maps_numericMonthDayString:(id)a3
{
  uint64_t v3 = qword_10160F4A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160F4A8, &stru_1012F3E98);
  }
  [(id)qword_10160F4A0 setLocalizedDateFormatFromTemplate:@"Md"];
  uint64_t v5 = [(id)qword_10160F4A0 stringFromDate:v4];

  return v5;
}

@end