@interface EKCalendarItem
- (id)eks_cacheKey;
- (id)eks_debugDesc;
@end

@implementation EKCalendarItem

- (id)eks_debugDesc
{
  id v4 = [objc_alloc((Class)NSMutableString) initWithCapacity:150];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = self;
  v7 = v6;
  if (isKindOfClass)
  {
    v8 = [(EKCalendarItem *)v6 startDate];
  }
  else
  {
    v9 = [(EKCalendarItem *)v6 dueDateComponents];
    v8 = [v9 date];
  }
  v10 = [(EKCalendarItem *)v7 title];

  [v4 appendString:@"\""];
  v11 = sub_10002D514(v10);
  [v4 appendString:v11];

  [v4 appendString:@"\"."];
  v12 = sub_10001750C(v8);
  [v4 appendString:v12];

  return v4;
}

- (id)eks_cacheKey
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = self;
    id v4 = [(EKCalendarItem *)v3 uniqueId];
    v5 = [(EKCalendarItem *)v3 title];
    v6 = [(EKCalendarItem *)v3 startDate];

    [v6 timeIntervalSinceReferenceDate];
    v8 = +[NSString stringWithFormat:@"%@;%@;%f", v4, v5, v7];
  }
  else
  {
    v8 = &stru_1000AB888;
  }

  return v8;
}

@end