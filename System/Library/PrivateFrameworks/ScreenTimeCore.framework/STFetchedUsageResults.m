@interface STFetchedUsageResults
+ (BOOL)supportsSecureCoding;
+ (id)classFallbacksForKeyedArchiver;
- (NSArray)aggregateUsageReports;
- (NSArray)localUsageReports;
- (NSDateInterval)dateInterval;
- (NSDictionary)usageReportsByCoreDuetIdentifier;
- (STFetchedUsageResults)initWithCoder:(id)a3;
- (STFetchedUsageResults)initWithDateInterval:(id)a3 partitionDurationInMinutes:(unint64_t)a4 localUsageReports:(id)a5 usageReportsByCoreDuetIdentifier:(id)a6 aggregateUsageReports:(id)a7;
- (unint64_t)partitionDurationInMinutes;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STFetchedUsageResults

- (STFetchedUsageResults)initWithDateInterval:(id)a3 partitionDurationInMinutes:(unint64_t)a4 localUsageReports:(id)a5 usageReportsByCoreDuetIdentifier:(id)a6 aggregateUsageReports:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)STFetchedUsageResults;
  v17 = [(STFetchedUsageResults *)&v26 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dateInterval, a3);
    v18->_partitionDurationInMinutes = a4;
    v19 = (NSArray *)[v14 copy];
    localUsageReports = v18->_localUsageReports;
    v18->_localUsageReports = v19;

    v21 = (NSDictionary *)[v15 copy];
    usageReportsByCoreDuetIdentifier = v18->_usageReportsByCoreDuetIdentifier;
    v18->_usageReportsByCoreDuetIdentifier = v21;

    v23 = (NSArray *)[v16 copy];
    aggregateUsageReports = v18->_aggregateUsageReports;
    v18->_aggregateUsageReports = v23;
  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STFetchedUsageResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)STFetchedUsageResults;
  v5 = [(STFetchedUsageResults *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_dateInterval"];
    dateInterval = v5->_dateInterval;
    v5->_dateInterval = (NSDateInterval *)v6;

    v5->_partitionDurationInMinutes = (unint64_t)[v4 decodeInt64ForKey:@"_partitionDurationInMinutes"];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_localUsageReports"];
    localUsageReports = v5->_localUsageReports;
    v5->_localUsageReports = (NSArray *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"_usageReportsByCoreDuetIdentifier"];
    usageReportsByCoreDuetIdentifier = v5->_usageReportsByCoreDuetIdentifier;
    v5->_usageReportsByCoreDuetIdentifier = (NSDictionary *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    v27 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v23, v24, v25, v26, objc_opt_class(), 0);
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"_aggregateUsageReports"];
    aggregateUsageReports = v5->_aggregateUsageReports;
    v5->_aggregateUsageReports = (NSArray *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dateInterval = self->_dateInterval;
  id v5 = a3;
  [v5 encodeObject:dateInterval forKey:@"_dateInterval"];
  [v5 encodeInt64:self->_partitionDurationInMinutes forKey:@"_partitionDurationInMinutes"];
  [v5 encodeObject:self->_localUsageReports forKey:@"_localUsageReports"];
  [v5 encodeObject:self->_usageReportsByCoreDuetIdentifier forKey:@"_usageReportsByCoreDuetIdentifier"];
  [v5 encodeObject:self->_aggregateUsageReports forKey:@"_aggregateUsageReports"];
}

+ (id)classFallbacksForKeyedArchiver
{
  return &off_10030FF90;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (unint64_t)partitionDurationInMinutes
{
  return self->_partitionDurationInMinutes;
}

- (NSArray)localUsageReports
{
  return self->_localUsageReports;
}

- (NSDictionary)usageReportsByCoreDuetIdentifier
{
  return self->_usageReportsByCoreDuetIdentifier;
}

- (NSArray)aggregateUsageReports
{
  return self->_aggregateUsageReports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateUsageReports, 0);
  objc_storeStrong((id *)&self->_usageReportsByCoreDuetIdentifier, 0);
  objc_storeStrong((id *)&self->_localUsageReports, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end