@interface NSDate(PhotosUICore)
+ (void)px_unionStartDate:()PhotosUICore endDate:withDate:;
+ (void)px_unionStartDate:()PhotosUICore endDate:withDateInterval:;
- (BOOL)px_isBetweenDate:()PhotosUICore andDate:;
- (BOOL)px_isWithinTimeInterval:()PhotosUICore sinceDate:;
- (id)px_dateTruncatedToCalendarUnit:()PhotosUICore calendar:;
- (uint64_t)px_isSameDayAsDate:()PhotosUICore;
- (unint64_t)px_yearsSinceDate:()PhotosUICore;
@end

@implementation NSDate(PhotosUICore)

+ (void)px_unionStartDate:()PhotosUICore endDate:withDate:
{
  id v7 = a5;
  v8 = v7;
  if (v7)
  {
    id v13 = v7;
    if (a3)
    {
      if (!*a3)
      {
        id v11 = v7;
        v8 = v13;
        *a3 = v11;
        if (!a4) {
          goto LABEL_11;
        }
        goto LABEL_6;
      }
      id v9 = [*a3 earlierDate:v7];
      *a3 = v9;

      v8 = v13;
    }
    if (!a4) {
      goto LABEL_11;
    }
LABEL_6:
    if (*a4)
    {
      id v10 = [*a4 laterDate:v13];
      *a4 = v10;

      v8 = v13;
    }
    else
    {
      id v12 = v8;
      v8 = v13;
      *a4 = v12;
    }
  }
LABEL_11:
}

- (id)px_dateTruncatedToCalendarUnit:()PhotosUICore calendar:
{
  id v7 = a4;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSDate+PhotosUICore.m", 108, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];
  }
  if (a3 > 31)
  {
    switch(a3)
    {
      case 32:
        uint64_t v8 = 62;
        break;
      case 64:
        uint64_t v8 = 126;
        break;
      case 128:
        uint64_t v8 = 254;
        break;
      default:
        goto LABEL_22;
    }
  }
  else
  {
    switch(a3)
    {
      case 4:
        uint64_t v8 = 6;
        break;
      case 8:
        uint64_t v8 = 14;
        break;
      case 16:
        uint64_t v8 = 30;
        break;
      default:
LABEL_22:
        id v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"NSCalendarUnit _CalendarUnitMaskForCalendarUnit(NSCalendarUnit)"];
        [v13 handleFailureInFunction:v14 file:@"NSDate+PhotosUICore.m" lineNumber:102 description:@"Code which should be unreachable has been reached"];

        abort();
    }
  }
  id v9 = [v7 components:v8 fromDate:a1];
  if (v9)
  {
    id v10 = [v7 dateFromComponents:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)px_isBetweenDate:()PhotosUICore andDate:
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = [v8 earlierDate:v7];
    id v10 = [v8 laterDate:v7];

    [a1 timeIntervalSinceDate:v9];
    if (v11 >= 0.0)
    {
      [a1 timeIntervalSinceDate:v10];
      BOOL v4 = v12 <= 0.0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)px_isWithinTimeInterval:()PhotosUICore sinceDate:
{
  if (!a4) {
    return 0;
  }
  objc_msgSend(a1, "timeIntervalSinceDate:");
  return v5 <= a2 && v5 >= 0.0;
}

- (unint64_t)px_yearsSinceDate:()PhotosUICore
{
  id v5 = a3;
  if (!v5)
  {
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"NSDate+PhotosUICore.m" lineNumber:23 description:@"date cannot be nil"];
  }
  [a1 timeIntervalSinceDate:v5];
  double v7 = v6;
  if (v6 < 0.0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"NSDate+PhotosUICore.m", 25, @"Invalid parameter not satisfying: %@", @"timeInterval >= 0" object file lineNumber description];
  }
  float v8 = v7 / 31557600.0;
  unint64_t v9 = vcvtas_u32_f32(v8);

  return v9;
}

- (uint64_t)px_isSameDayAsDate:()PhotosUICore
{
  BOOL v4 = (void *)MEMORY[0x1E4F1C9A8];
  id v5 = a3;
  double v6 = [v4 currentCalendar];
  uint64_t v7 = [v6 isDate:a1 inSameDayAsDate:v5];

  return v7;
}

+ (void)px_unionStartDate:()PhotosUICore endDate:withDateInterval:
{
  id v7 = a5;
  if (v7)
  {
    id v16 = v7;
    if (a3)
    {
      float v8 = *a3;
      unint64_t v9 = [v7 startDate];
      id v10 = v9;
      if (v8)
      {
        id v11 = [v8 earlierDate:v9];
        *a3 = v11;
      }
      else
      {
        *a3 = v9;
      }

      id v7 = v16;
    }
    if (a4)
    {
      double v12 = *a4;
      id v13 = [v7 endDate];
      v14 = v13;
      if (v12)
      {
        id v15 = [v12 laterDate:v13];
        *a4 = v15;
      }
      else
      {
        *a4 = v13;
      }

      id v7 = v16;
    }
  }
}

@end