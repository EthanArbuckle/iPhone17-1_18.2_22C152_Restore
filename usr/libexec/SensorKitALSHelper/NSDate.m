@interface NSDate
+ (id)sr_localMidnightFollowingDate:(id)a3;
+ (id)sr_localMidnightPriorToDate:(id)a3;
@end

@implementation NSDate

+ (id)sr_localMidnightPriorToDate:(id)a3
{
  v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") componentsInTimeZone:+[NSTimeZone localTimeZone] fromDate:a3];
  [(NSDateComponents *)v3 setHour:0];
  [(NSDateComponents *)v3 setMinute:0];
  [(NSDateComponents *)v3 setSecond:0];
  [(NSDateComponents *)v3 setNanosecond:0];

  return [(NSDateComponents *)v3 date];
}

+ (id)sr_localMidnightFollowingDate:(id)a3
{
  v3 = [+[NSCalendar currentCalendar](NSCalendar, "currentCalendar") componentsInTimeZone:+[NSTimeZone localTimeZone] fromDate:a3];
  [(NSDateComponents *)v3 setDay:(char *)[(NSDateComponents *)v3 day] + 1];
  [(NSDateComponents *)v3 setHour:0];
  [(NSDateComponents *)v3 setMinute:0];
  [(NSDateComponents *)v3 setSecond:0];
  [(NSDateComponents *)v3 setNanosecond:0];

  return [(NSDateComponents *)v3 date];
}

@end