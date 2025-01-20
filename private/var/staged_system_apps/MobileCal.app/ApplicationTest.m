@interface ApplicationTest
+ (id)testName;
- (Application)application;
- (ApplicationTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5;
- (CUIKCalendarModel)model;
- (NSDictionary)options;
- (id)extractInitialDateOption;
- (void)runTest;
- (void)setApplication:(id)a3;
- (void)setModel:(id)a3;
- (void)setOptions:(id)a3;
- (void)setupData;
@end

@implementation ApplicationTest

+ (id)testName
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (ApplicationTest)initWithApplication:(id)a3 model:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ApplicationTest;
  v12 = [(ApplicationTest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    objc_storeStrong((id *)&v13->_options, a5);
    objc_storeStrong((id *)&v13->_model, a4);
    [(ApplicationTest *)v13 setupData];
  }

  return v13;
}

- (void)runTest
{
  v3 = [(id)objc_opt_class() testName];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = +[NSString stringWithFormat:@"runTest should be overridden for class: [%@]", v5];

  [(Application *)self->_application startedTest:v3];
  [(Application *)self->_application failedTest:v3 withFailure:v6];
  v7 = kCalUILogTestHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogTestHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
}

- (id)extractInitialDateOption
{
  v3 = [(ApplicationTest *)self model];
  v4 = [v3 eventStore];
  v5 = [v4 timeZone];

  v6 = [(ApplicationTest *)self options];
  v7 = [v6 objectForKey:@"initialDate"];

  v8 = +[NSUserDefaults standardUserDefaults];
  id v9 = [v8 objectForKey:@"PPTForceRestoreDate"];

  id v10 = objc_alloc_init((Class)NSDateComponents);
  [v10 setYear:2024];
  [v10 setMonth:6];
  [v10 setDay:1];
  id v11 = [objc_alloc((Class)EKCalendarDate) initWithDateComponents:v10 timeZone:v5];
  if (v7) {
    v12 = v7;
  }
  else {
    v12 = v9;
  }
  if (v12)
  {
    v13 = [v12 componentsSeparatedByString:@"-"];
    v14 = objc_opt_new();
    objc_super v15 = [v13 objectAtIndex:0];
    [v14 setYear:[v15 intValue]];

    v16 = [v13 objectAtIndex:1];
    [v14 setMonth:[v16 intValue]];

    v17 = [v13 objectAtIndex:2];
    [v14 setDay:[v17 intValue]];

    v18 = [v13 objectAtIndex:3];
    [v14 setHour:[v18 intValue]];

    v19 = [v13 objectAtIndex:4];
    [v14 setMinute:[v19 intValue]];

    v20 = [v13 objectAtIndex:5];
    [v20 doubleValue];
    [v14 setSecond:(uint64_t)v21];

    v22 = [v13 objectAtIndex:5];
    [v22 doubleValue];
    [v14 setNanosecond:(uint64_t)-((double)(uint64_t)[v14 second] - v23 * 1000000000.0)];

    id v24 = [objc_alloc((Class)EKCalendarDate) initWithDateComponents:v14 timeZone:v5];
  }
  else
  {
    id v24 = v11;
  }
  id v25 = v24;

  return v25;
}

- (void)setupData
{
  self->_useLegacyData = 0;
  v3 = [(NSDictionary *)self->_options objectForKey:@"useLegacyData"];
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 BOOLValue];
    self->_useLegacyData = v5;
    if (!v5) {
      goto LABEL_15;
    }
  }
  else if (!self->_useLegacyData)
  {
    goto LABEL_15;
  }
  v19 = v4;
  v6 = [(CUIKCalendarModel *)self->_model eventStore];
  v7 = [v6 calendarsForEntityType:0];

  v8 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_super v15 = [v14 title];
        unsigned int v16 = [v15 containsString:@"Legacy"];

        if (v16) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  model = self->_model;
  v18 = +[NSSet setWithArray:v8];
  [(CUIKCalendarModel *)model setSelectedCalendars:v18];

  v4 = v19;
LABEL_15:
}

- (Application)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (CUIKCalendarModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end