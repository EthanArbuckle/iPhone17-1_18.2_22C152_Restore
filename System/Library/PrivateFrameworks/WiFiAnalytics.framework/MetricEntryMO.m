@interface MetricEntryMO
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateInstance:(id)a3;
+ (unint64_t)metricEntryCount:(unint64_t)a3 moc:(id)a4;
@end

@implementation MetricEntryMO

+ (id)entityName
{
  return @"MetricEntry";
}

+ (id)generateInstance:(id)a3
{
  id v3 = a3;
  v4 = +[MetricEntryMO entityName];
  v5 = +[AnalyticsStoreProxy createEntity:v4 moc:v3];

  return v5;
}

+ (unint64_t)metricEntryCount:(unint64_t)a3 moc:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = +[MetricEntryMO entityName];
  v7 = +[AnalyticsStoreProxy fetchRequestForEntity:v6];
  v8 = v7;
  if (v7)
  {
    [v7 setFetchLimit:a3];
    id v12 = 0;
    unint64_t v9 = [v5 countForFetchRequest:v8 error:&v12];
    v10 = v12;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v9 = 0;
    }
  }
  else
  {
    v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v14 = "+[MetricEntryMO metricEntryCount:moc:]";
      __int16 v15 = 1024;
      int v16 = 36;
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:fetch request nil for entity:%@", buf, 0x1Cu);
    }
    unint64_t v9 = 0;
  }

  return v9;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"MetricEntry"];
}

@end