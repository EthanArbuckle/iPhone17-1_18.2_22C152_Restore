@interface NSDate(MTUtilities)
+ (id)mtEarliest:()MTUtilities;
+ (id)mtLatest:()MTUtilities;
+ (id)mtNow;
- (BOOL)mtIsAfterOrSameAsDate:()MTUtilities;
- (BOOL)mtIsBeforeOrSameAsDate:()MTUtilities;
- (id)mtDateNearestMatchingComponents:()MTUtilities;
- (id)mtDescription;
- (id)mtMidnightForDate;
- (uint64_t)mtIsAfterDate:()MTUtilities;
- (uint64_t)mtIsBeforeDate:()MTUtilities;
@end

@implementation NSDate(MTUtilities)

+ (id)mtNow
{
  MTCurrentDateProvider();
  v0 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1 = v0[2]();

  return v1;
}

- (uint64_t)mtIsBeforeDate:()MTUtilities
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MTUtilities.m" lineNumber:74 description:@"date can't be nil"];
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

- (BOOL)mtIsBeforeOrSameAsDate:()MTUtilities
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MTUtilities.m" lineNumber:79 description:@"date can't be nil"];
  }
  v6 = [a1 earlierDate:v5];
  BOOL v7 = v6 == a1;

  return v7;
}

- (uint64_t)mtIsAfterDate:()MTUtilities
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MTUtilities.m" lineNumber:84 description:@"date can't be nil"];
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

- (BOOL)mtIsAfterOrSameAsDate:()MTUtilities
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"MTUtilities.m" lineNumber:89 description:@"date can't be nil"];
  }
  v6 = [a1 laterDate:v5];
  BOOL v7 = v6 == a1;

  return v7;
}

- (id)mtDateNearestMatchingComponents:()MTUtilities
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v6 = [v5 components:224 fromDate:a1];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    id v8 = a1;
  }
  else
  {
    v9 = [v5 mtPreviousDateBeforeDate:a1 matchingComponents:v4];
    v10 = [v5 mtNextDateAfterDate:a1 matchingComponents:v4];
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

+ (id)mtLatest:()MTUtilities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || [v9 mtIsAfterDate:v6]))
        {
          id v10 = v9;

          v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)mtEarliest:()MTUtilities
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (!v6 || [v9 mtIsBeforeDate:v6]))
        {
          id v10 = v9;

          v6 = v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mtMidnightForDate
{
  v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v3 = [v2 startOfDayForDate:a1];

  return v3;
}

- (id)mtDescription
{
  v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  id v3 = [a1 descriptionWithLocale:v2];

  return v3;
}

@end