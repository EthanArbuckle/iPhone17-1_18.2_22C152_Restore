@interface TPSAnalyticsProcessor
+ (id)loadValueForKey:(id)a3 class:(Class)a4;
+ (void)saveValue:(id)a3 forKey:(id)a4;
- (NSDate)dateLastRun;
- (TPSAnalyticsProcessor)init;
- (TPSAnalyticsProcessorDataSource)dataSource;
- (TPSDuetDataProvider)duetDataProvider;
- (void)processAnalytics:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDateLastRun:(id)a3;
@end

@implementation TPSAnalyticsProcessor

- (TPSAnalyticsProcessor)init
{
  v11.receiver = self;
  v11.super_class = (Class)TPSAnalyticsProcessor;
  v2 = [(TPSAnalyticsProcessor *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4FAF380] sharedInstance];
    analyticsEventController = v2->_analyticsEventController;
    v2->_analyticsEventController = (TPSAnalyticsEventController *)v3;

    v5 = NSString;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 stringWithFormat:@"%@%@", v7, @"_DateLastRun"];
    dateLastRunKey = v2->_dateLastRunKey;
    v2->_dateLastRunKey = (NSString *)v8;
  }
  return v2;
}

- (NSDate)dateLastRun
{
  uint64_t v3 = objc_opt_class();
  dateLastRunKey = self->_dateLastRunKey;
  uint64_t v5 = objc_opt_class();

  return (NSDate *)[v3 loadValueForKey:dateLastRunKey class:v5];
}

- (void)setDateLastRun:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() saveValue:v4 forKey:self->_dateLastRunKey];
}

+ (void)saveValue:(id)a3 forKey:(id)a4
{
}

+ (id)loadValueForKey:(id)a3 class:(Class)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = a3;
  v7 = [v5 setWithObject:a4];
  uint64_t v8 = [MEMORY[0x1E4FAF4B0] unarchivedObjectOfClasses:v7 forKey:v6];

  return v8;
}

- (void)processAnalytics:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (TPSDuetDataProvider)duetDataProvider
{
  return self->_duetDataProvider;
}

- (TPSAnalyticsProcessorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (TPSAnalyticsProcessorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_duetDataProvider, 0);
  objc_storeStrong((id *)&self->_dateLastRunKey, 0);

  objc_storeStrong((id *)&self->_analyticsEventController, 0);
}

@end