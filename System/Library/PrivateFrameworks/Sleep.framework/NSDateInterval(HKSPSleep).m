@interface NSDateInterval(HKSPSleep)
- (id)hkspDescription;
- (uint64_t)hksp_containsDate:()HKSPSleep;
- (uint64_t)hksp_containsDate:()HKSPSleep searchOptions:;
- (uint64_t)hksp_overlapsInterval:()HKSPSleep;
- (uint64_t)hksp_overlapsInterval:()HKSPSleep searchOptions:;
@end

@implementation NSDateInterval(HKSPSleep)

- (uint64_t)hksp_containsDate:()HKSPSleep searchOptions:
{
  id v6 = a3;
  v7 = [a1 startDate];
  int v8 = [v7 isEqualToDate:v6];

  if (v8)
  {
    uint64_t v9 = a4 & 1;
  }
  else
  {
    v10 = [a1 endDate];
    int v11 = [v10 isEqualToDate:v6];

    if (v11) {
      uint64_t v9 = (a4 >> 1) & 1;
    }
    else {
      uint64_t v9 = [a1 containsDate:v6];
    }
  }

  return v9;
}

- (uint64_t)hksp_containsDate:()HKSPSleep
{
  return objc_msgSend(a1, "hksp_containsDate:searchOptions:", a3, 3);
}

- (uint64_t)hksp_overlapsInterval:()HKSPSleep
{
  return objc_msgSend(a1, "hksp_overlapsInterval:searchOptions:", a3, 3);
}

- (uint64_t)hksp_overlapsInterval:()HKSPSleep searchOptions:
{
  id v6 = a3;
  v7 = [a1 endDate];
  int v8 = [v6 startDate];
  int v9 = [v7 isEqualToDate:v8];

  if (v9)
  {
    uint64_t v10 = (a4 >> 1) & 1;
  }
  else
  {
    int v11 = [a1 startDate];
    v12 = [v6 endDate];
    int v13 = [v11 isEqualToDate:v12];

    if (v13) {
      uint64_t v10 = a4 & 1;
    }
    else {
      uint64_t v10 = [a1 intersectsDateInterval:v6];
    }
  }

  return v10;
}

- (id)hkspDescription
{
  v2 = NSString;
  uint64_t v3 = objc_opt_class();
  v4 = [a1 startDate];
  v5 = [v4 hkspDescription];
  id v6 = [a1 endDate];
  v7 = [v6 hkspDescription];
  int v8 = [v2 stringWithFormat:@"<%@:%p [%@ - %@] >", v3, a1, v5, v7];

  return v8;
}

@end