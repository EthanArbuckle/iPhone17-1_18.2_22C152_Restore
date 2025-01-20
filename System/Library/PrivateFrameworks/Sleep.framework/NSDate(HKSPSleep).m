@interface NSDate(HKSPSleep)
+ (id)hksp_closestFromDates:()HKSPSleep toDate:;
+ (id)hksp_earliestFromDates:()HKSPSleep;
+ (id)hksp_latestFromDates:()HKSPSleep;
- (BOOL)hksp_isAfterOrSameAsDate:()HKSPSleep;
- (BOOL)hksp_isBeforeOrSameAsDate:()HKSPSleep;
- (id)hkspDescription;
- (id)hksp_dateNearestMatchingComponents:()HKSPSleep;
- (uint64_t)hksp_isAfterDate:()HKSPSleep;
- (uint64_t)hksp_isBeforeDate:()HKSPSleep;
- (uint64_t)hksp_isWithinInterval:()HKSPSleep ofDate:;
@end

@implementation NSDate(HKSPSleep)

- (id)hkspDescription
{
  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  v3 = [a1 descriptionWithLocale:v2];

  return v3;
}

- (uint64_t)hksp_isBeforeDate:()HKSPSleep
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"NSDate+HKSPSleep.m" lineNumber:22 description:@"date can't be nil"];
  }
  v6 = [a1 earlierDate:v5];
  if (v6 == a1) {
    uint64_t v7 = [a1 isEqualToDate:v5] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hksp_isBeforeOrSameAsDate:()HKSPSleep
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"NSDate+HKSPSleep.m" lineNumber:27 description:@"date can't be nil"];
  }
  v6 = [a1 earlierDate:v5];
  BOOL v7 = v6 == a1;

  return v7;
}

- (uint64_t)hksp_isAfterDate:()HKSPSleep
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"NSDate+HKSPSleep.m" lineNumber:32 description:@"date can't be nil"];
  }
  v6 = [a1 laterDate:v5];
  if (v6 == a1) {
    uint64_t v7 = [a1 isEqualToDate:v5] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)hksp_isAfterOrSameAsDate:()HKSPSleep
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"NSDate+HKSPSleep.m" lineNumber:37 description:@"date can't be nil"];
  }
  v6 = [a1 laterDate:v5];
  BOOL v7 = v6 == a1;

  return v7;
}

- (id)hksp_dateNearestMatchingComponents:()HKSPSleep
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v4 setSecond:0];
  v6 = [v5 components:224 fromDate:a1];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = a1;
  }
  else
  {
    v9 = objc_msgSend(v5, "hksp_previousDateBeforeDate:matchingComponents:", a1, v4);
    v10 = objc_msgSend(v5, "hksp_nextDateAfterDate:matchingComponents:", a1, v4);
    [a1 timeIntervalSinceDate:v9];
    double v12 = v11;
    [v10 timeIntervalSinceDate:a1];
    if (v13 >= v12) {
      v14 = v9;
    }
    else {
      v14 = v10;
    }
    id v8 = v14;
  }
  return v8;
}

+ (id)hksp_latestFromDates:()HKSPSleep
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    double v11 = __Block_byref_object_dispose__0;
    id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__NSDate_HKSPSleep__hksp_latestFromDates___block_invoke;
    v6[3] = &unk_1E5D32498;
    v6[4] = &v7;
    objc_msgSend(v3, "na_each:", v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)hksp_earliestFromDates:()HKSPSleep
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__0;
    double v11 = __Block_byref_object_dispose__0;
    id v12 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__NSDate_HKSPSleep__hksp_earliestFromDates___block_invoke;
    v6[3] = &unk_1E5D32498;
    v6[4] = &v7;
    objc_msgSend(v3, "na_each:", v6);
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)hksp_closestFromDates:()HKSPSleep toDate:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    id v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0x41DFFFFFFFC00000;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__NSDate_HKSPSleep__hksp_closestFromDates_toDate___block_invoke;
    v9[3] = &unk_1E5D324C0;
    id v10 = v6;
    double v11 = v13;
    id v12 = &v14;
    objc_msgSend(v5, "na_each:", v9);
    id v7 = (id)v15[5];

    _Block_object_dispose(v13, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (uint64_t)hksp_isWithinInterval:()HKSPSleep ofDate:
{
  id v6 = (objc_class *)MEMORY[0x1E4F28C18];
  id v7 = a4;
  id v8 = [v6 alloc];
  uint64_t v9 = [a1 dateByAddingTimeInterval:-a2];
  id v10 = [a1 dateByAddingTimeInterval:a2];
  double v11 = (void *)[v8 initWithStartDate:v9 endDate:v10];

  uint64_t v12 = objc_msgSend(v11, "hksp_containsDate:", v7);
  return v12;
}

@end