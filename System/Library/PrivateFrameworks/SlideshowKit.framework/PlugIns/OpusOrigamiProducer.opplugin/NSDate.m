@interface NSDate
- (id)descriptionWithFormat:(id)a3;
- (id)roundMinuteToNearstFifteen;
- (id)roundMinuteToNearstFive;
- (id)storedCalendar;
- (id)storedFormatter;
@end

@implementation NSDate

- (id)descriptionWithFormat:(id)a3
{
  id v5 = [(NSDate *)self storedFormatter];
  [v5 setDateFormat:a3];
  return [v5 stringFromDate:self];
}

- (id)storedFormatter
{
  id result = (id)qword_1F12F8;
  if (!qword_1F12F8)
  {
    id v3 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"English"];
    qword_1F12F8 = (uint64_t)objc_alloc_init((Class)NSDateFormatter);
    [(id)qword_1F12F8 setLocale:v3];

    return (id)qword_1F12F8;
  }
  return result;
}

- (id)storedCalendar
{
  id result = (id)qword_1F1300;
  if (!qword_1F1300)
  {
    id result = +[NSCalendar currentCalendar];
    qword_1F1300 = (uint64_t)result;
  }
  return result;
}

- (id)roundMinuteToNearstFifteen
{
  id v3 = objc_msgSend(objc_msgSend(-[NSDate storedCalendar](self, "storedCalendar"), "components:fromDate:", 96, self), "minute");
  double v4 = (float)((float)((float)(uint64_t)v3 - (float)(floorf((float)(uint64_t)v3 / 15.0) * 15.0)) * -60.0);
  return [(NSDate *)self dateByAddingTimeInterval:v4];
}

- (id)roundMinuteToNearstFive
{
  id v3 = objc_msgSend(objc_msgSend(-[NSDate storedCalendar](self, "storedCalendar"), "components:fromDate:", 96, self), "minute");
  double v4 = (float)((float)((float)(uint64_t)v3 - (float)(floorf((float)(uint64_t)v3 / 5.0) * 5.0)) * -60.0);
  return [(NSDate *)self dateByAddingTimeInterval:v4];
}

@end