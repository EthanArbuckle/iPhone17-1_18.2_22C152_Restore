@interface MRDNowPlayingDataSource
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedDataSource;
- (BOOL)nowPlayingApplicationIsInterrupted;
- (BOOL)nowPlayingApplicationIsPlaying;
- (BOOL)shouldSendCommand:(id)a3;
- (MRDNowPlayingDataSource)init;
- (NSDictionary)nowPlayingApplications;
- (NSDictionary)nowPlayingAudioFormatContentInfos;
- (NSDictionary)nowPlayingSessions;
- (NSString)nowPlayingApplicationDisplayID;
- (NSString)topOfNowPlayingAppStack;
- (id)observersForSelector:(SEL)a3;
- (id)pickableRoutesForCategory:(id)a3;
- (int)nowPlayingApplicationPID;
- (void)addObserver:(id)a3;
- (void)popNowPlayingAppStack:(BOOL)a3 forReason:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation MRDNowPlayingDataSource

+ (id)sharedDataSource
{
  if (qword_10047DF48 != -1) {
    dispatch_once(&qword_10047DF48, &stru_100417B10);
  }
  v2 = (void *)qword_10047DF40;

  return v2;
}

- (MRDNowPlayingDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)MRDNowPlayingDataSource;
  return [(MRDNowPlayingDataSource *)&v3 init];
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[MRDNowPlayingDataSource allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MRDNowPlayingDataSource;
    return objc_msgSendSuper2(&v6, "allocWithZone:", a3);
  }
}

- (void)addObserver:(id)a3
{
  id v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  weakObservers = v4->_weakObservers;
  if (!weakObservers)
  {
    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    v7 = v4->_weakObservers;
    v4->_weakObservers = (NSHashTable *)v6;

    weakObservers = v4->_weakObservers;
  }
  [(NSHashTable *)weakObservers addObject:v8];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_weakObservers removeObject:v5];
  objc_sync_exit(v4);
}

- (id)observersForSelector:(SEL)a3
{
  v4 = self;
  objc_sync_enter(v4);
  id v5 = [(NSHashTable *)v4->_weakObservers allObjects];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100052A04;
  v8[3] = &unk_100417B30;
  v8[4] = a3;
  uint64_t v6 = objc_msgSend(v5, "msv_filter:", v8);

  objc_sync_exit(v4);

  return v6;
}

- (id)pickableRoutesForCategory:(id)a3
{
  return 0;
}

- (BOOL)shouldSendCommand:(id)a3
{
  return 1;
}

- (NSDictionary)nowPlayingApplications
{
  return 0;
}

- (NSDictionary)nowPlayingSessions
{
  return 0;
}

- (NSString)topOfNowPlayingAppStack
{
  return 0;
}

- (void)popNowPlayingAppStack:(BOOL)a3 forReason:(int64_t)a4
{
  BOOL v4 = a3;
  LOBYTE(v7) = a3;
  MRAnalyticsSendEvent();
  if (v4) {
    [(MRDNowPlayingDataSource *)self _popNowPlayingAppStack];
  }
}

- (NSDictionary)nowPlayingAudioFormatContentInfos
{
  return self->_nowPlayingAudioFormatContentInfos;
}

- (NSString)nowPlayingApplicationDisplayID
{
  return self->_nowPlayingApplicationDisplayID;
}

- (int)nowPlayingApplicationPID
{
  return self->_nowPlayingApplicationPID;
}

- (BOOL)nowPlayingApplicationIsPlaying
{
  return self->_nowPlayingApplicationIsPlaying;
}

- (BOOL)nowPlayingApplicationIsInterrupted
{
  return self->_nowPlayingApplicationIsInterrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingApplicationDisplayID, 0);
  objc_storeStrong((id *)&self->_nowPlayingAudioFormatContentInfos, 0);

  objc_storeStrong((id *)&self->_weakObservers, 0);
}

@end