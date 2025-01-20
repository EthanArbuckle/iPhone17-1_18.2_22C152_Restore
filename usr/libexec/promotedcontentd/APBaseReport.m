@interface APBaseReport
+ (id)reportFrequencyStringKey;
+ (int64_t)reportFrequency;
- (APBaseReport)initWithReportDate:(id)a3 purpose:(int64_t)a4 reportEventCount:(id)a5;
- (APDBReportEventCount)reportEventCount;
- (APReportDate)reportDate;
- (NSDictionary)environmentToBranchDic;
- (NSDictionary)properties;
- (NSString)reportType;
- (id)_createBranchForEnvironments;
- (id)_createProperties;
- (id)_eventCountDictionary;
- (int64_t)metric;
- (int64_t)purpose;
- (void)setReportDate:(id)a3;
@end

@implementation APBaseReport

- (APBaseReport)initWithReportDate:(id)a3 purpose:(int64_t)a4 reportEventCount:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APBaseReport;
  v10 = [(APBaseReport *)&v19 init];
  v11 = v10;
  if (v10)
  {
    v10->_purpose = a4;
    v12 = [[APReportDate alloc] initWithDate:v8];
    reportDate = v11->_reportDate;
    v11->_reportDate = v12;

    objc_storeStrong((id *)&v11->_reportEventCount, a5);
    uint64_t v14 = [(APBaseReport *)v11 _createProperties];
    properties = v11->_properties;
    v11->_properties = (NSDictionary *)v14;

    uint64_t v16 = [(APBaseReport *)v11 _createBranchForEnvironments];
    environmentToBranchDic = v11->_environmentToBranchDic;
    v11->_environmentToBranchDic = (NSDictionary *)v16;
  }
  return v11;
}

+ (int64_t)reportFrequency
{
  return 1901;
}

+ (id)reportFrequencyStringKey
{
  id v2 = [(id)objc_opt_class() reportFrequency];
  CFStringRef v3 = @"1d";
  if (v2 == (id)1902) {
    CFStringRef v3 = @"1w";
  }
  if (v2 == (id)1903) {
    return @"1m";
  }
  else {
    return (id)v3;
  }
}

- (void)setReportDate:(id)a3
{
  objc_storeStrong((id *)&self->_reportDate, a3);
  id v9 = a3;
  v5 = [(APBaseReport *)self _createProperties];
  properties = self->_properties;
  self->_properties = v5;

  v7 = [(APBaseReport *)self _createBranchForEnvironments];
  environmentToBranchDic = self->_environmentToBranchDic;
  self->_environmentToBranchDic = v7;
}

- (id)_createProperties
{
  CFStringRef v3 = NSStringFromSelector(a2);
  v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  APSimulateCrash();

  v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_eventCountDictionary
{
  CFStringRef v3 = NSStringFromSelector(a2);
  v4 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v3];
  APSimulateCrash();

  v5 = NSStringFromSelector(a2);
  v6 = +[NSString stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)_createBranchForEnvironments
{
  id v2 = [(APBaseReport *)self _eventCountDictionary];
  if ([v2 count])
  {
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [v2 allKeys];
    id v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v7 = objc_alloc_init((Class)NSMutableSet);
          id v8 = v2;
          id v9 = [v2 objectForKey:v6];
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v22;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v22 != v12) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v14 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) branch];
                if (v14) {
                  [v7 addObjectsFromArray:v14];
                }
              }
              id v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v11);
          }
          v15 = [v7 allObjects];
          [v20 setObject:v15 forKey:v6];

          id v2 = v8;
        }
        id v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v4);
    }

    id v16 = +[NSDictionary dictionaryWithDictionary:v20];
  }
  else
  {
    id v16 = objc_alloc_init((Class)NSDictionary);
  }

  return v16;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (APReportDate)reportDate
{
  return self->_reportDate;
}

- (int64_t)metric
{
  return self->_metric;
}

- (NSDictionary)environmentToBranchDic
{
  return self->_environmentToBranchDic;
}

- (NSString)reportType
{
  return self->_reportType;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (APDBReportEventCount)reportEventCount
{
  return self->_reportEventCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportEventCount, 0);
  objc_storeStrong((id *)&self->_reportType, 0);
  objc_storeStrong((id *)&self->_environmentToBranchDic, 0);
  objc_storeStrong((id *)&self->_reportDate, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end