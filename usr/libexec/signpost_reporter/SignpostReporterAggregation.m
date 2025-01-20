@interface SignpostReporterAggregation
- (NSDictionary)aggregationDictionary;
- (SignpostReporterAggregation)init;
- (id)keysInDescendingCountOrder;
- (unint64_t)countForSubsystem:(id)a3 category:(id)a4;
- (unint64_t)totalCount;
- (void)incrementSubsystem:(id)a3 category:(id)a4;
@end

@implementation SignpostReporterAggregation

- (SignpostReporterAggregation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SignpostReporterAggregation;
  v2 = [(SignpostReporterAggregation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    aggregationDictionary = v2->_aggregationDictionary;
    v2->_aggregationDictionary = (NSDictionary *)v3;
  }
  return v2;
}

- (unint64_t)countForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[SignpostReporterAggregationKey alloc] initWithSubsystem:v7 category:v6];

  v9 = [(SignpostReporterAggregation *)self aggregationDictionary];
  v10 = [v9 objectForKeyedSubscript:v8];

  if (v10) {
    id v11 = [v10 unsignedLongLongValue];
  }
  else {
    id v11 = 0;
  }

  return (unint64_t)v11;
}

- (id)keysInDescendingCountOrder
{
  v2 = [(SignpostReporterAggregation *)self aggregationDictionary];
  uint64_t v3 = [v2 keysSortedByValueUsingComparator:&stru_100010980];

  return v3;
}

- (void)incrementSubsystem:(id)a3 category:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = [(SignpostReporterAggregation *)self aggregationDictionary];
  v8 = [[SignpostReporterAggregationKey alloc] initWithSubsystem:v7 category:v6];

  uint64_t v9 = [v12 objectForKeyedSubscript:v8];
  if (v9) {
    v10 = (_UNKNOWN **)v9;
  }
  else {
    v10 = &off_1000121C0;
  }
  id v11 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)[v10 unsignedLongLongValue] + 1);
  [v12 setObject:v11 forKeyedSubscript:v8];

  ++self->_totalCount;
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (NSDictionary)aggregationDictionary
{
  return self->_aggregationDictionary;
}

- (void).cxx_destruct
{
}

@end