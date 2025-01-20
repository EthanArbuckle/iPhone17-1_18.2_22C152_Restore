@interface NSTimeZone(ICSTranslation)
- (id)ICSComputeTimeZoneChangeListFromDate:()ICSTranslation toDate:;
@end

@implementation NSTimeZone(ICSTranslation)

- (id)ICSComputeTimeZoneChangeListFromDate:()ICSTranslation toDate:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  id v9 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v10 = (void *)[v9 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v10 setTimeZone:a1];
  v32 = v6;
  v30 = [v6 components];
  v11 = objc_msgSend(v10, "dateFromComponents:");
  v31 = v7;
  v33 = [v7 components];
  v12 = objc_msgSend(v10, "dateFromComponents:");
  [v11 timeIntervalSinceReferenceDate];
  double v14 = v13;
  [v12 timeIntervalSinceReferenceDate];
  double v16 = v15;
  v17 = [v11 dateByAddingTimeInterval:1.0];
  uint64_t v18 = [a1 secondsFromGMTForDate:v17];

  uint64_t v19 = [a1 nextDaylightSavingTimeTransitionAfterDate:v11];
  if (v19)
  {
    v20 = (void *)v19;
    do
    {
      [v20 timeIntervalSinceReferenceDate];
      double v22 = v21;
      if (v21 >= v14 && v21 <= v16)
      {
        v24 = [v20 dateByAddingTimeInterval:1.0];
        uint64_t v18 = [a1 secondsFromGMTForDate:v24];

        v25 = [[ICSTimeZoneChange alloc] initWithTimeInterval:v18 tzOffsetTo:v22];
        [v8 addObject:v25];
      }
      if (v22 > v16) {
        break;
      }
      v26 = [v20 dateByAddingTimeInterval:1.0];
      v27 = [a1 nextDaylightSavingTimeTransitionAfterDate:v26];

      if ([v27 compare:v20] != 1)
      {

        break;
      }

      v20 = v27;
    }
    while (v27);
  }
  if (![v8 count])
  {
    v28 = [[ICSTimeZoneChange alloc] initWithTimeInterval:v18 tzOffsetTo:0.0];
    [v8 addObject:v28];
  }
  [v8 sortUsingSelector:sel_compare_];

  return v8;
}

@end