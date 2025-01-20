@interface APIntegrityDatasource
+ (int64_t)reportFrequency;
- (id)_createProperties;
- (id)_eventCountDictionary;
- (id)reportType;
- (int64_t)metric;
@end

@implementation APIntegrityDatasource

+ (int64_t)reportFrequency
{
  v3 = +[APConfigurationMediator configurationForClass:objc_opt_class()];
  v4 = [v3 reportingFrequency];

  if (v4)
  {
    v5 = [v3 reportingFrequency];
    id v6 = [v5 integerValue];
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___APIntegrityDatasource;
    id v6 = [super reportFrequency];
  }

  return (int64_t)v6;
}

- (id)reportType
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"%@-%lu", v4, [(APBaseReport *)self purpose]];

  return v5;
}

- (id)_createProperties
{
  v2 = [(APIntegrityDatasource *)self _eventCountDictionary];
  v3 = v2;
  if (v2 && [v2 count])
  {
    id v29 = objc_alloc_init((Class)NSMutableDictionary);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = [v3 allKeys];
    id v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v31)
    {
      uint64_t v27 = *(void *)v40;
      v28 = v3;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v40 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v34 = v4;
          uint64_t v5 = *(void *)(*((void *)&v39 + 1) + 8 * v4);
          id v6 = objc_alloc_init((Class)NSMutableDictionary);
          v7 = [(APBaseReport *)self reportDate];
          objc_super v8 = [v7 reportDayString];
          [v6 setObject:v8 forKey:@"date_MMDD"];

          v9 = +[NSNumber numberWithInteger:[(APBaseReport *)self purpose]];
          [v6 setObject:v9 forKey:@"report_purpose"];

          v10 = +[APBaseReport reportFrequencyStringKey];
          v33 = v6;
          [v6 setObject:v10 forKey:@"report_frequency"];

          uint64_t v32 = v5;
          v11 = [v3 objectForKey:v5];
          id v12 = objc_alloc_init((Class)NSMutableDictionary);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v13 = v11;
          id v14 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v36;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v36 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                v19 = [v18 event];
                v20 = [v12 objectForKey:v19];

                [v18 count];
                if (v20) {
                  v21 = {;
                }
                  v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v21 integerValue] + [v20 integerValue]);
                }
                else {
                  v22 = {;
                }
                }
                v23 = [v18 event];
                [v12 setObject:v22 forKey:v23];
              }
              id v15 = [v13 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v15);
          }

          [v33 setObject:v12 forKey:@"event_count"];
          [v29 setObject:v33 forKey:v32];

          uint64_t v4 = v34 + 1;
          v3 = v28;
        }
        while ((id)(v34 + 1) != v31);
        id v31 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v31);
    }

    id v24 = +[NSDictionary dictionaryWithDictionary:v29];
  }
  else
  {
    id v24 = objc_alloc_init((Class)NSDictionary);
  }

  return v24;
}

- (id)_eventCountDictionary
{
  v3 = [(APBaseReport *)self reportDate];
  int64_t v4 = [(APBaseReport *)self purpose];
  if ([(id)objc_opt_class() reportFrequency] != (id)1901) {
    goto LABEL_4;
  }
  uint64_t v5 = [(APBaseReport *)self reportEventCount];
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 reportEndDay]);
  v7 = +[NSNumber numberWithInteger:v4];
  objc_super v8 = [v5 groupedEventCountForDayOfYear:v6 purpose:v7];

  if (v8)
  {
    id v9 = +[NSDictionary dictionaryWithDictionary:v8];
  }
  else
  {
LABEL_4:
    id v9 = objc_alloc_init((Class)NSDictionary);
  }

  return v9;
}

- (int64_t)metric
{
  return 1500;
}

@end