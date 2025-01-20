@interface __BEPaginationLogsLogsLevelObserver
+ (__BEPaginationLogsLogsLevelObserver)shared;
- (NSDictionary)logLevels;
- (__BEPaginationLogsLogsLevelObserver)init;
- (void)_userDefaultsDidChange:(id)a3;
- (void)setLevel:(id)a3 forLog:(id)a4;
- (void)setLogLevels:(id)a3;
@end

@implementation __BEPaginationLogsLogsLevelObserver

+ (__BEPaginationLogsLogsLevelObserver)shared
{
  if (qword_409C30[0] != -1) {
    dispatch_once(qword_409C30, &stru_3C15B0);
  }
  v2 = (void *)qword_409C28;

  return (__BEPaginationLogsLogsLevelObserver *)v2;
}

- (__BEPaginationLogsLogsLevelObserver)init
{
  v8.receiver = self;
  v8.super_class = (Class)__BEPaginationLogsLogsLevelObserver;
  v2 = [(__BEPaginationLogsLogsLevelObserver *)&v8 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    uint64_t v4 = [v3 objectForKey:@"BEPaginationLogs"];
    logLevels = v2->_logLevels;
    v2->_logLevels = (NSDictionary *)v4;

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_userDefaultsDidChange:" name:NSUserDefaultsDidChangeNotification object:0];
  }
  return v2;
}

- (void)_userDefaultsDidChange:(id)a3
{
  id v7 = +[NSUserDefaults standardUserDefaults];
  uint64_t v4 = [v7 objectForKey:@"BEPaginationLogs"];
  v5 = (void *)v4;
  if (v4) {
    v6 = (void *)v4;
  }
  else {
    v6 = &__NSDictionary0__struct;
  }
  objc_storeStrong((id *)&self->_logLevels, v6);
}

- (void)setLogLevels:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  v5 = +[NSUserDefaults standardUserDefaults];
  [v5 setObject:v4 forKey:@"BEPaginationLogs"];

  logLevels = self->_logLevels;
  self->_logLevels = v4;
}

- (void)setLevel:(id)a3 forLog:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(__BEPaginationLogsLogsLevelObserver *)self logLevels];
  id v9 = [v8 mutableCopy];

  [v9 setObject:v7 forKeyedSubscript:v6];
  [(__BEPaginationLogsLogsLevelObserver *)self setLogLevels:v9];
}

- (NSDictionary)logLevels
{
  return self->_logLevels;
}

- (void).cxx_destruct
{
}

@end