@interface NSTimeZone(MNExtras)
- (BOOL)_navigation_isEquivalentToTimeZone:()MNExtras forDate:;
- (uint64_t)_navigation_hasSameOffsetFromGMTAsTimeZone:()MNExtras;
- (uint64_t)_navigation_isEquivalentToTimeZone:()MNExtras forDates:;
@end

@implementation NSTimeZone(MNExtras)

- (uint64_t)_navigation_hasSameOffsetFromGMTAsTimeZone:()MNExtras
{
  return objc_msgSend(a1, "_navigation_isEquivalentToTimeZone:forDate:", a3, 0);
}

- (BOOL)_navigation_isEquivalentToTimeZone:()MNExtras forDate:
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (v7)
    {
      uint64_t v8 = [a1 secondsFromGMTForDate:v7];
      uint64_t v9 = [v6 secondsFromGMTForDate:v7];
    }
    else
    {
      uint64_t v8 = [a1 secondsFromGMT];
      uint64_t v9 = [v6 secondsFromGMT];
    }
    BOOL v10 = v8 == v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (uint64_t)_navigation_isEquivalentToTimeZone:()MNExtras forDates:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          if (!objc_msgSend(a1, "_navigation_isEquivalentToTimeZone:forDate:", v6, *(void *)(*((void *)&v15 + 1) + 8 * v12), (void)v15))
          {
            uint64_t v13 = 0;
            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v13 = 1;
LABEL_12:
  }
  else
  {
    uint64_t v13 = objc_msgSend(a1, "_navigation_isEquivalentToTimeZone:forDate:", v6, 0);
  }

  return v13;
}

@end