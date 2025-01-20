@interface _UIDatePickerMode_MonthDay
+ (int64_t)datePickerMode;
+ (unint64_t)extractableCalendarUnits;
- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3;
- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3;
@end

@implementation _UIDatePickerMode_MonthDay

+ (int64_t)datePickerMode
{
  return 4270;
}

+ (unint64_t)extractableCalendarUnits
{
  return 24;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  if (a3 == 16) {
    return 8;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  if (a3 == 8) {
    return 16;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

@end