@interface STQueryInterval
- (NSDate)startDate;
- (NSDateInterval)dateInterval;
- (STQueryInterval)initWithStartDate:(id)a3 partitionTimeInterval:(double)a4;
- (double)partitionTimeInterval;
- (id)debugDescription;
- (unint64_t)numberOfPartitions;
- (void)setNumberOfPartitions:(unint64_t)a3;
- (void)setPartitionTimeInterval:(double)a3;
- (void)setStartDate:(id)a3;
@end

@implementation STQueryInterval

- (STQueryInterval)initWithStartDate:(id)a3 partitionTimeInterval:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STQueryInterval;
  v8 = [(STQueryInterval *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_startDate, a3);
    v9->_partitionTimeInterval = a4;
  }

  return v9;
}

- (NSDateInterval)dateInterval
{
  v3 = [(STQueryInterval *)self startDate];
  [(STQueryInterval *)self partitionTimeInterval];
  v5 = objc_msgSend(v3, "dateByAddingTimeInterval:", v4 * (double)-[STQueryInterval numberOfPartitions](self, "numberOfPartitions"));
  if ([v5 compare:v3] == (id)-1)
  {
    id v6 = v3;

    v5 = v6;
  }
  id v7 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v3 endDate:v5];

  return (NSDateInterval *)v7;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  v5 = [(STQueryInterval *)self startDate];
  [(STQueryInterval *)self partitionTimeInterval];
  id v7 = +[NSString stringWithFormat:@"<%@: %p { startDate = %@, partitionTimeInterval = %.2f, numberOfPartitions = %lu }>", v4, self, v5, v6, [(STQueryInterval *)self numberOfPartitions]];

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (unint64_t)numberOfPartitions
{
  return self->_numberOfPartitions;
}

- (void)setNumberOfPartitions:(unint64_t)a3
{
  self->_numberOfPartitions = a3;
}

- (double)partitionTimeInterval
{
  return self->_partitionTimeInterval;
}

- (void)setPartitionTimeInterval:(double)a3
{
  self->_partitionTimeInterval = a3;
}

- (void).cxx_destruct
{
}

@end