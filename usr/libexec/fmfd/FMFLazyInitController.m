@interface FMFLazyInitController
+ (id)sharedInstance;
- (BOOL)allowInitForSessionCreation;
- (BOOL)lastLazyCheckWasInLazyStateDueToNoFriendsOrFollower;
- (BOOL)lazyTimeLoaded;
- (NSDate)lastSuccessfulInitDate;
- (NSNumber)numberOfFriendsAndFollowers;
- (double)lazyInitTimeoutInSecStoredValue;
- (void)accountWasRemoved:(id)a3;
- (void)expireInitTimestamp;
- (void)modelDidLoadSuccessfully:(id)a3;
- (void)setLastSuccessfulInitDate:(id)a3;
- (void)setLazyInitTimeoutInSecStoredValue:(double)a3;
- (void)setLazyTimeLoaded:(BOOL)a3;
- (void)setNumberOfFriendsAndFollowers:(id)a3;
- (void)updateFriendsFollowersCount:(id)a3;
@end

@implementation FMFLazyInitController

- (BOOL)allowInitForSessionCreation
{
  v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFLazyInitController checking allowInitForSessionCreation", (uint8_t *)v22, 2u);
  }

  [(FMFLazyInitController *)self lazyInitTimeoutInSecStoredValue];
  double v5 = v4;
  uint64_t v6 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
  if (!v6) {
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
  if ([v8 unsignedIntegerValue])
  {

LABEL_6:
    BOOL v9 = 1;
    goto LABEL_7;
  }
  v17 = [(FMFLazyInitController *)self lastSuccessfulInitDate];

  BOOL v9 = 1;
  if (v17 && v5 > 0.0)
  {
    v18 = sub_100005560();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "FMFLazyInitController has friends/followers/lastdate info", (uint8_t *)v22, 2u);
    }

    v19 = +[NSDate date];
    [v19 timeIntervalSinceDate:self->_lastSuccessfulInitDate];
    double v21 = v20;

    BOOL v9 = v21 > v5;
  }
LABEL_7:
  v10 = sub_100005560();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
    v12 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
    id v13 = [v12 unsignedIntegerValue];
    v14 = [(FMFLazyInitController *)self lastSuccessfulInitDate];
    [(FMFLazyInitController *)self lazyInitTimeoutInSecStoredValue];
    v22[0] = 67110146;
    v22[1] = v11 == 0;
    __int16 v23 = 2048;
    id v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    __int16 v27 = 2048;
    uint64_t v28 = v15;
    __int16 v29 = 1024;
    BOOL v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "allowInitForSessionCreation FF is nil: %d, FF count: %lu, last init date: %@, lazy timeout stored value: %f, allow init: %d", (uint8_t *)v22, 0x2Cu);
  }
  return v9;
}

- (double)lazyInitTimeoutInSecStoredValue
{
  if (![(FMFLazyInitController *)self lazyTimeLoaded])
  {
    [(FMFLazyInitController *)self setLazyTimeLoaded:1];
    v3 = +[FMFDataManager sharedInstance];
    [v3 lazyInitTimeoutInSec];

    double v4 = +[NSUserDefaults standardUserDefaults];
    double v5 = [v4 objectForKey:@"lazyInitTimeSecsStoredKey"];
    [v5 doubleValue];
    [(FMFLazyInitController *)self setLazyInitTimeoutInSecStoredValue:"setLazyInitTimeoutInSecStoredValue:"];
  }
  return self->_lazyInitTimeoutInSecStoredValue;
}

- (BOOL)lazyTimeLoaded
{
  return self->_lazyTimeLoaded;
}

- (void)setLastSuccessfulInitDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSuccessfulInitDate, a3);
  id v5 = a3;
  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setObject:self->_lastSuccessfulInitDate forKey:@"lastSuccessfulInitDateKey"];

  id v7 = +[NSUserDefaults standardUserDefaults];

  [v7 synchronize];
}

- (NSNumber)numberOfFriendsAndFollowers
{
  numberOfFriendsAndFollowers = self->_numberOfFriendsAndFollowers;
  if (!numberOfFriendsAndFollowers)
  {
    double v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 objectForKey:@"numberOfFriendsFollowersKey"];
    [(FMFLazyInitController *)self setNumberOfFriendsAndFollowers:v5];

    numberOfFriendsAndFollowers = self->_numberOfFriendsAndFollowers;
  }

  return numberOfFriendsAndFollowers;
}

- (void)setNumberOfFriendsAndFollowers:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfFriendsAndFollowers, a3);
  id v5 = a3;
  uint64_t v6 = +[NSUserDefaults standardUserDefaults];
  [v6 setObject:self->_numberOfFriendsAndFollowers forKey:@"numberOfFriendsFollowersKey"];

  id v7 = +[NSUserDefaults standardUserDefaults];

  [v7 synchronize];
}

- (NSDate)lastSuccessfulInitDate
{
  lastSuccessfulInitDate = self->_lastSuccessfulInitDate;
  if (!lastSuccessfulInitDate)
  {
    double v4 = +[NSUserDefaults standardUserDefaults];
    id v5 = [v4 objectForKey:@"lastSuccessfulInitDateKey"];
    [(FMFLazyInitController *)self setLastSuccessfulInitDate:v5];

    lastSuccessfulInitDate = self->_lastSuccessfulInitDate;
  }

  return lastSuccessfulInitDate;
}

+ (id)sharedInstance
{
  if (qword_1000BB6C8 != -1) {
    dispatch_once(&qword_1000BB6C8, &stru_1000A1D68);
  }
  v2 = (void *)qword_1000BB6C0;

  return v2;
}

- (void)updateFriendsFollowersCount:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
  if (!v4
    || (id v5 = (void *)v4,
        id v6 = [v9 integerValue],
        [(FMFLazyInitController *)self numberOfFriendsAndFollowers],
        id v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 integerValue],
        v7,
        v5,
        v6 != v8))
  {
    [(FMFLazyInitController *)self setNumberOfFriendsAndFollowers:v9];
  }
}

- (BOOL)lastLazyCheckWasInLazyStateDueToNoFriendsOrFollower
{
  v3 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
  if (v3)
  {
    uint64_t v4 = [(FMFLazyInitController *)self numberOfFriendsAndFollowers];
    BOOL v5 = [v4 unsignedIntegerValue] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)accountWasRemoved:(id)a3
{
  [(FMFLazyInitController *)self setLastSuccessfulInitDate:0];
  [(FMFLazyInitController *)self setNumberOfFriendsAndFollowers:0];
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObjectForKey:@"lastSuccessfulInitDateKey"];

  BOOL v5 = +[NSUserDefaults standardUserDefaults];
  [v5 removeObjectForKey:@"numberOfFriendsFollowersKey"];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];
}

- (void)modelDidLoadSuccessfully:(id)a3
{
  id v4 = +[NSDate date];
  [(FMFLazyInitController *)self setLastSuccessfulInitDate:v4];
}

- (void)setLazyInitTimeoutInSecStoredValue:(double)a3
{
  self->_lazyInitTimeoutInSecStoredValue = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  BOOL v5 = +[NSNumber numberWithDouble:self->_lazyInitTimeoutInSecStoredValue];
  [v4 setObject:v5 forKey:@"lazyInitTimeSecsStoredKey"];

  id v6 = +[NSUserDefaults standardUserDefaults];
  [v6 synchronize];
}

- (void)expireInitTimestamp
{
  id v3 = +[NSDate date];
  [(FMFLazyInitController *)self setLastSuccessfulInitDate:v3];
}

- (void)setLazyTimeLoaded:(BOOL)a3
{
  self->_lazyTimeLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfFriendsAndFollowers, 0);

  objc_storeStrong((id *)&self->_lastSuccessfulInitDate, 0);
}

@end