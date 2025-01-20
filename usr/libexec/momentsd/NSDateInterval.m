@interface NSDateInterval
- (id)unionWithDateInterval:(id)a3;
@end

@implementation NSDateInterval

- (id)unionWithDateInterval:(id)a3
{
  id v4 = a3;
  if ([(NSDateInterval *)self intersectsDateInterval:v4])
  {
    v5 = [(NSDateInterval *)self startDate];
    v6 = [v4 startDate];
    v7 = [v5 earlierDate:v6];

    v8 = [(NSDateInterval *)self endDate];
    v9 = [v4 endDate];
    v10 = [v8 laterDate:v9];

    if ([v7 isBeforeDate:v10]) {
      id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 endDate:v10];
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end