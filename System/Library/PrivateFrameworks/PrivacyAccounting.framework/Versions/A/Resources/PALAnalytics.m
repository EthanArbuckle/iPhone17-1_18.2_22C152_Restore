@interface PALAnalytics
- (BOOL)updateWithPublisher:(id)a3 cancellationToken:(id)a4 error:(id *)a5;
- (NSDictionary)eventPayload;
- (NSDictionary)totalAccessCountByCategory;
- (PALAnalytics)initWithSettings:(id)a3;
- (double)averageAccessSizeInBytes;
- (double)standardDeviationAccessSizeInBytes;
- (id)description;
- (unint64_t)totalAccessCount;
- (unint64_t)totalStoreSizeInBytes;
- (unint64_t)uniqueAccessorCount;
- (void)updateWithEvent:(id)a3;
@end

@implementation PALAnalytics

- (PALAnalytics)initWithSettings:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PALAnalytics;
  v6 = [(PALAnalytics *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v7->_totalAccessCount = 0;
    v7->_totalStoreSizeInBytes = 0;
    uint64_t v8 = +[NSMutableSet set];
    uniqueAccessors = v7->_uniqueAccessors;
    v7->_uniqueAccessors = (NSMutableSet *)v8;

    uint64_t v10 = +[NSMutableDictionary dictionaryWithCapacity:10];
    totalAccessCountByCategory = v7->_totalAccessCountByCategory;
    v7->_totalAccessCountByCategory = (NSMutableDictionary *)v10;
  }
  return v7;
}

- (void)updateWithEvent:(id)a3
{
  id v21 = a3;
  v4 = [v21 eventBodyData];
  if ([v4 length])
  {
    self->_totalStoreSizeInBytes += (unint64_t)[v4 length];
    ++self->_totalAccessCount;
    id v5 = [v21 eventBody];
    v6 = v5;
    if (v5)
    {
      uniqueAccessors = self->_uniqueAccessors;
      uint64_t v8 = [v5 accessor];
      [(NSMutableSet *)uniqueAccessors addObject:v8];

      totalAccessCountByCategory = self->_totalAccessCountByCategory;
      uint64_t v10 = [v6 category];
      v11 = [(NSMutableDictionary *)totalAccessCountByCategory objectForKeyedSubscript:v10];
      v12 = (char *)[v11 unsignedIntegerValue];

      objc_super v13 = +[NSNumber numberWithUnsignedInteger:v12 + 1];
      v14 = self->_totalAccessCountByCategory;
      v15 = [v6 category];
      [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
    }
    double runningAverageSizeInBytes = self->_runningAverageSizeInBytes;
    double v17 = runningAverageSizeInBytes
        + ((double)(unint64_t)[v4 length] - runningAverageSizeInBytes)
        / (double)self->_totalAccessCount;
    double runningSumOfSquaresSizeInBytes = self->_runningSumOfSquaresSizeInBytes;
    double v19 = (double)(unint64_t)[v4 length] - self->_runningAverageSizeInBytes;
    id v20 = [v4 length];
    self->_double runningAverageSizeInBytes = v17;
    self->_double runningSumOfSquaresSizeInBytes = runningSumOfSquaresSizeInBytes + v19 * ((double)(unint64_t)v20 - v17);
  }
}

- (BOOL)updateWithPublisher:(id)a3 cancellationToken:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 1;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000065F0;
  v23 = sub_100006600;
  id v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100006608;
  v18[3] = &unk_100018860;
  v18[4] = &v25;
  v18[5] = &v19;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100006680;
  v13[3] = &unk_100018888;
  id v9 = a4;
  v16 = &v25;
  double v17 = &v19;
  id v14 = v9;
  v15 = self;
  id v10 = [v8 sinkWithCompletion:v18 shouldContinue:v13];
  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

- (NSDictionary)eventPayload
{
  if (qword_10001F288 != -1) {
    dispatch_once(&qword_10001F288, &stru_1000188A8);
  }
  v3 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", (char *)[(id)qword_10001F290 count] + 1);
  v4 = +[NSNumber numberWithBool:[(PALSettings *)self->_settings loggingEnabled]];
  [v3 setObject:v4 forKeyedSubscript:@"enabled"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)qword_10001F290;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v11 = objc_msgSend((id)qword_10001F290, "objectForKeyedSubscript:", v10, (void)v14);
        v12 = [(PALAnalytics *)self valueForKeyPath:v11];
        [v3 setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSDictionary *)v3;
}

- (unint64_t)uniqueAccessorCount
{
  return (unint64_t)[(NSMutableSet *)self->_uniqueAccessors count];
}

- (double)averageAccessSizeInBytes
{
  return self->_runningAverageSizeInBytes;
}

- (double)standardDeviationAccessSizeInBytes
{
  unint64_t totalAccessCount = self->_totalAccessCount;
  if (totalAccessCount) {
    return sqrt(self->_runningSumOfSquaresSizeInBytes / (double)totalAccessCount);
  }
  else {
    return 0.0;
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(PALAnalytics *)self eventPayload];
  id v5 = [v4 description];
  id v6 = +[NSString stringWithFormat:@"<%@ %p %@>", v3, self, v5];

  return v6;
}

- (unint64_t)totalAccessCount
{
  return self->_totalAccessCount;
}

- (NSDictionary)totalAccessCountByCategory
{
  return &self->_totalAccessCountByCategory->super;
}

- (unint64_t)totalStoreSizeInBytes
{
  return self->_totalStoreSizeInBytes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalAccessCountByCategory, 0);
  objc_storeStrong((id *)&self->_uniqueAccessors, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end