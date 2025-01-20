@interface _OSIntervalHistory
+ (id)sharedInstance;
- (BOOL)refreshCacheIfStaleWithQueryDate:(id)a3;
- (NSArray)allIntervalsSortByStartAsc;
- (NSDate)lastQueryDate;
- (NSDate)lastRefreshDate;
- (OS_os_log)log;
- (_OSIntervalHistory)init;
- (id)newestIntervalInHistory;
- (id)oldestIntervalInHistory;
- (void)loadHistoryFromUnderlyingDataSource;
- (void)setAllIntervalsSortByStartAsc:(id)a3;
- (void)setLastQueryDate:(id)a3;
- (void)setLastRefreshDate:(id)a3;
- (void)setLog:(id)a3;
- (void)updateStratasWithQueryDate:(id)a3;
@end

@implementation _OSIntervalHistory

+ (id)sharedInstance
{
  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass", "+[_OSIntervalHistory sharedInstance]");
  id v3 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v2 userInfo:0];

  objc_exception_throw(v3);
}

- (_OSIntervalHistory)init
{
  v8.receiver = self;
  v8.super_class = (Class)_OSIntervalHistory;
  v2 = [(_OSIntervalHistory *)&v8 init];
  if (v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    os_log_t v5 = os_log_create("com.apple.osintelligence", (const char *)[v4 UTF8String]);
    log = v2->_log;
    v2->_log = (OS_os_log *)v5;

    [(_OSIntervalHistory *)v2 loadHistoryFromUnderlyingDataSource];
  }
  return v2;
}

- (void)loadHistoryFromUnderlyingDataSource
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
    sub_100042DBC((os_log_t)log);
  }
}

- (id)newestIntervalInHistory
{
  return [(NSArray *)self->_allIntervalsSortByStartAsc lastObject];
}

- (id)oldestIntervalInHistory
{
  return [(NSArray *)self->_allIntervalsSortByStartAsc firstObject];
}

- (BOOL)refreshCacheIfStaleWithQueryDate:(id)a3
{
  os_log_t v5 = (NSDate *)a3;
  v6 = +[NSDate now];
  v7 = [v6 earlierDate:v5];

  if (self->_lastRefreshDate && (objc_msgSend(v7, "timeIntervalSinceDate:"), v8 < 900.0))
  {
    BOOL v9 = 0;
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      lastRefreshDate = self->_lastRefreshDate;
      int v14 = 138412546;
      v15 = v5;
      __int16 v16 = 2112;
      v17 = lastRefreshDate;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Refreshing history because input date = %@ and last refreshed at %@", (uint8_t *)&v14, 0x16u);
    }
    [(_OSIntervalHistory *)self loadHistoryFromUnderlyingDataSource];
    BOOL v9 = 1;
  }
  lastQueryDate = self->_lastQueryDate;
  if (!lastQueryDate || lastQueryDate != v5)
  {
    [(_OSIntervalHistory *)self updateStratasWithQueryDate:v5];
    objc_storeStrong((id *)&self->_lastQueryDate, a3);
  }

  return v9;
}

- (void)updateStratasWithQueryDate:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s must be overridden in a subclass", "-[_OSIntervalHistory updateStratasWithQueryDate:]");
  id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

  objc_exception_throw(v5);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDate)lastRefreshDate
{
  return self->_lastRefreshDate;
}

- (void)setLastRefreshDate:(id)a3
{
}

- (NSDate)lastQueryDate
{
  return self->_lastQueryDate;
}

- (void)setLastQueryDate:(id)a3
{
}

- (NSArray)allIntervalsSortByStartAsc
{
  return self->_allIntervalsSortByStartAsc;
}

- (void)setAllIntervalsSortByStartAsc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIntervalsSortByStartAsc, 0);
  objc_storeStrong((id *)&self->_lastQueryDate, 0);
  objc_storeStrong((id *)&self->_lastRefreshDate, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end