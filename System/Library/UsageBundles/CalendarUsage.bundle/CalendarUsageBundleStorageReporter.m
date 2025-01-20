@interface CalendarUsageBundleStorageReporter
- (BOOL)allowDeletionForCategory:(id)a3;
- (CalendarUsageBundleStorageReporter)init;
- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3;
- (float)sizeForCategory:(id)a3;
- (id)usageBundleApps;
- (void)populateUsageBundleApps;
@end

@implementation CalendarUsageBundleStorageReporter

- (CalendarUsageBundleStorageReporter)init
{
  v8.receiver = self;
  v8.super_class = (Class)CalendarUsageBundleStorageReporter;
  v2 = [(CalendarUsageBundleStorageReporter *)&v8 init];
  if (v2)
  {
    sub_2CF8();
    v3 = (void *)qword_8930;
    if (os_log_type_enabled((os_log_t)qword_8930, OS_LOG_TYPE_DEBUG))
    {
      v4 = v3;
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEBUG, "Initializing %@", buf, 0xCu);
    }
  }
  return v2;
}

- (void)populateUsageBundleApps
{
  id v29 = +[PSUsageBundleApp usageBundleAppForBundleWithIdentifier:@"com.apple.mobilecal" withTotalSize:0.0];
  v3 = +[CalendarUsageBundle bundle];
  v28 = [v3 localizedStringForKey:@"Calendar" value:&stru_4258 table:0];

  [v29 setName:v28];
  id v27 = [objc_alloc((Class)EKEventStore) initWithEKOptions:132];
  v4 = [v27 fetchStorageUsage];
  uint64_t v5 = [v4 objectForKeyedSubscript:EKStorageUsageEventsKey];
  v6 = (void *)v5;
  if (v5) {
    v7 = (_UNKNOWN **)v5;
  }
  else {
    v7 = &off_4358;
  }
  objc_super v8 = v7;

  uint64_t v9 = [v4 objectForKeyedSubscript:EKStorageUsageAttachmentsKey];
  v10 = (void *)v9;
  if (v9) {
    v11 = (_UNKNOWN **)v9;
  }
  else {
    v11 = &off_4358;
  }
  v12 = v11;

  v13 = (char *)[v8 longLongValue];
  v26 = &v13[(void)[v12 longLongValue]];
  id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v15 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  cachedCategorySizes = self->_cachedCategorySizes;
  self->_cachedCategorySizes = v15;

  [(NSMutableDictionary *)self->_cachedCategorySizes setObject:v8 forKey:@"CATEGORY_EVENTS"];
  v17 = +[CalendarUsageBundle bundle];
  v18 = [v17 localizedStringForKey:@"Events" value:&stru_4258 table:0];

  v19 = +[PSUsageBundleCategory categoryNamed:v18 withIdentifier:@"CATEGORY_EVENTS" forUsageBundleApp:v29];
  [v14 addObject:v19];
  [(NSMutableDictionary *)self->_cachedCategorySizes setObject:v12 forKey:@"CATEGORY_ATTACHMENTS"];

  v20 = +[CalendarUsageBundle bundle];
  v21 = [v20 localizedStringForKey:@"Attachments" value:&stru_4258 table:0];

  v22 = +[PSUsageBundleCategory categoryNamed:v21 withIdentifier:@"CATEGORY_ATTACHMENTS" forUsageBundleApp:v29];

  [v14 addObject:v22];
  *(float *)&double v23 = (float)(unint64_t)v26;
  [v29 setTotalSize:v23];
  [v29 setCategories:v14];
  v24 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v29, 0);
  cachedBundleApps = self->_cachedBundleApps;
  self->_cachedBundleApps = v24;
}

- (id)usageBundleApps
{
  cachedBundleApps = self->_cachedBundleApps;
  if (!cachedBundleApps)
  {
    [(CalendarUsageBundleStorageReporter *)self populateUsageBundleApps];
    cachedBundleApps = self->_cachedBundleApps;
  }

  return cachedBundleApps;
}

- (BOOL)allowDeletionForCategory:(id)a3
{
  id v3 = a3;
  v4 = (void *)qword_8920;
  if (!qword_8920)
  {
    v13[0] = @"CATEGORY_EVENTS";
    uint64_t v5 = +[NSNumber numberWithBool:0];
    v13[1] = @"CATEGORY_ATTACHMENTS";
    v14[0] = v5;
    v6 = +[NSNumber numberWithBool:0];
    v14[1] = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    objc_super v8 = (void *)qword_8920;
    qword_8920 = v7;

    v4 = (void *)qword_8920;
  }
  uint64_t v9 = [v3 identifier];
  v10 = [v4 objectForKey:v9];
  unsigned __int8 v11 = [v10 BOOLValue];

  return v11;
}

- (Class)usageDetailControllerClassForUsageBundleApp:(id)a3
{
  return (Class)objc_opt_class();
}

- (float)sizeForCategory:(id)a3
{
  id v4 = a3;
  cachedCategorySizes = self->_cachedCategorySizes;
  if (!cachedCategorySizes)
  {
    [(CalendarUsageBundleStorageReporter *)self populateUsageBundleApps];
    cachedCategorySizes = self->_cachedCategorySizes;
  }
  v6 = [v4 identifier];
  uint64_t v7 = [(NSMutableDictionary *)cachedCategorySizes objectForKey:v6];
  [v7 floatValue];
  float v9 = v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCategorySizes, 0);

  objc_storeStrong((id *)&self->_cachedBundleApps, 0);
}

@end