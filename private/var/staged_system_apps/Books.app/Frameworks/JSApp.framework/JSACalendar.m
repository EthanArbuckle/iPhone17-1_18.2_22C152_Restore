@interface JSACalendar
+ (unint64_t)firstDayOfWeek;
@end

@implementation JSACalendar

+ (unint64_t)firstDayOfWeek
{
  v2 = +[NSCalendar currentCalendar];
  id v3 = [v2 firstWeekday];

  return (unint64_t)v3;
}

@end