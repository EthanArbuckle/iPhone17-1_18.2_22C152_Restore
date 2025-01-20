@interface REMSnoozeTimeUtils
+ (int64_t)nextThirdsHour:(int64_t)a3;
+ (int64_t)nextThirdsHourFromHour:(int64_t)a3;
@end

@implementation REMSnoozeTimeUtils

+ (int64_t)nextThirdsHourFromHour:(int64_t)a3
{
  if ((unint64_t)(a3 % 24) <= 0xFFFFFFFFFFFFFFE7) {
    unint64_t v3 = a3 % 24;
  }
  else {
    unint64_t v3 = a3 % 24 + 24;
  }
  unint64_t v4 = REMLocalizedTimeOfDayCreationHour(0);
  unint64_t v5 = REMLocalizedTimeOfDayCreationHour(2uLL);
  unint64_t v6 = REMLocalizedTimeOfDayCreationHour(5uLL);
  int64_t result = 0;
  if (v3 >= v4)
  {
    if (v3 >= v5)
    {
      if (v3 < v6) {
        return 2;
      }
      else {
        return 3;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

+ (int64_t)nextThirdsHour:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      unint64_t v4 = 0;
      goto LABEL_4;
    case 1:
      unint64_t v4 = 2;
      goto LABEL_4;
    case 2:
      unint64_t v4 = 5;
LABEL_4:
      int64_t result = REMLocalizedTimeOfDayCreationHour(v4);
      break;
    case 3:
      int64_t result = REMLocalizedTimeOfDayCreationHour(0) + 24;
      break;
    default:
      return result;
  }
  return result;
}

@end