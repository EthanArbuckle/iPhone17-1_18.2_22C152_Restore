@interface NSArray
- (double)getTotalDurationOfMOEventBundleArray;
- (id)getDurationOfMOEventArray;
- (id)getTimeSpanOfMOEventBundleArray;
- (id)sortBundlesByTimespan;
- (id)sortMOEventArrayByEndDate;
- (id)sortMOEventArrayByStartDate;
- (id)sortMOEventBundleArrayByEndDate;
- (id)sortMOEventBundleArrayByStartDate;
@end

@implementation NSArray

- (id)sortMOEventArrayByStartDate
{
  id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [(NSArray *)self sortedArrayUsingDescriptors:v4];

  return v5;
}

- (id)sortMOEventArrayByEndDate
{
  id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  id v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [(NSArray *)self sortedArrayUsingDescriptors:v4];

  return v5;
}

- (id)getDurationOfMOEventArray
{
  id v3 = [(NSArray *)self sortMOEventArrayByStartDate];
  v4 = [v3 firstObject];

  v5 = [v4 startDate];
  v6 = [(NSArray *)self sortMOEventArrayByEndDate];
  id v7 = [v6 lastObject];

  v8 = [v7 endDate];
  id v9 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v8];

  return v9;
}

- (id)sortMOEventBundleArrayByStartDate
{
  id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
  id v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [(NSArray *)self sortedArrayUsingDescriptors:v4];

  return v5;
}

- (id)sortMOEventBundleArrayByEndDate
{
  id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"endDate" ascending:1];
  id v7 = v3;
  v4 = +[NSArray arrayWithObjects:&v7 count:1];
  v5 = [(NSArray *)self sortedArrayUsingDescriptors:v4];

  return v5;
}

- (id)getTimeSpanOfMOEventBundleArray
{
  id v3 = [(NSArray *)self sortMOEventBundleArrayByStartDate];
  v4 = [v3 firstObject];

  v5 = [v4 startDate];
  v6 = [(NSArray *)self sortMOEventBundleArrayByEndDate];
  id v7 = [v6 lastObject];

  v8 = [v7 endDate];
  id v9 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v8];

  return v9;
}

- (id)sortBundlesByTimespan
{
  return [(NSArray *)self sortedArrayUsingComparator:&__block_literal_global_33];
}

int64_t __46__NSArray_MOExtensions__sortBundlesByTimespan__block_invoke(id a1, MOEventBundle *a2, MOEventBundle *a3)
{
  v4 = a2;
  v5 = a3;
  id v6 = objc_alloc((Class)NSDateInterval);
  id v7 = [(MOEventBundle *)v4 startDate];
  v8 = [(MOEventBundle *)v4 endDate];
  id v9 = [v6 initWithStartDate:v7 endDate:v8];
  [v9 duration];
  double v11 = v10;

  id v12 = objc_alloc((Class)NSDateInterval);
  v13 = [(MOEventBundle *)v5 startDate];
  v14 = [(MOEventBundle *)v5 endDate];
  id v15 = [v12 initWithStartDate:v13 endDate:v14];
  [v15 duration];
  double v17 = v16;

  if (v11 >= v17)
  {
    if (v11 <= v17)
    {
      v19 = [(MOEventBundle *)v4 bundleIdentifier];
      v20 = [(MOEventBundle *)v5 bundleIdentifier];
      int64_t v18 = (int64_t)[v19 compare:v20];
    }
    else
    {
      int64_t v18 = 1;
    }
  }
  else
  {
    int64_t v18 = -1;
  }

  return v18;
}

- (double)getTotalDurationOfMOEventBundleArray
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = self;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_alloc((Class)NSDateInterval);
        double v10 = [v8 startDate:v15];
        double v11 = [v8 endDate];
        id v12 = [v9 initWithStartDate:v10 endDate:v11];
        [v12 duration];
        double v6 = v6 + v13;
      }
      id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

@end