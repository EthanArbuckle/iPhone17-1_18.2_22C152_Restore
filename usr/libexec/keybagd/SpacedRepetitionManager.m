@interface SpacedRepetitionManager
+ (id)sharedInstance;
- (BOOL)beginNewRepetitionPeriod;
- (BOOL)checkForVerificationEpoch;
- (BOOL)commitNextVerificationEpoch;
- (BOOL)continueRepetitionPeriod;
- (BOOL)handleVerificationEpoch;
- (BOOL)repetitionPeriodTimer:(id)a3;
- (BOOL)setupNextTimer;
- (BOOL)writeConfig;
- (SpacedRepetitionManager)init;
- (id)initialize;
- (id)readConfig;
- (int64_t)getNextVerificationEpoch;
- (int64_t)getSpacedRepetitionTimeout;
- (void)dealloc;
- (void)setupIntervals;
- (void)stopSpacedRepetition;
@end

@implementation SpacedRepetitionManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000036A8;
  block[3] = &unk_100030C28;
  block[4] = a1;
  if (qword_100039880 != -1) {
    dispatch_once(&qword_100039880, block);
  }
  return (id)qword_100039888;
}

- (SpacedRepetitionManager)init
{
}

- (void)setupIntervals
{
  if (dword_100039850 == 1) {
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_100036838, &off_100036850, &off_100036868, 0);
  }
  else {
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_100036880, &off_100036898, 0, v3);
  }
  qword_100039858 = (uint64_t)v2;
}

- (id)initialize
{
  v5.receiver = self;
  v5.super_class = (Class)SpacedRepetitionManager;
  v2 = [(SpacedRepetitionManager *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(SpacedRepetitionManager *)v2 setupIntervals];
    [(SpacedRepetitionManager *)v3 readConfig];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SpacedRepetitionManager;
  [(SpacedRepetitionManager *)&v3 dealloc];
}

- (id)readConfig
{
  if (qword_100039860) {

  }
  id result = [objc_alloc((Class)NSMutableDictionary) initWithContentsOfFile:@"/private/var/root/Library/Preferences/com.apple.spaced_repetition.plist"];
  qword_100039860 = (uint64_t)result;
  if (!result)
  {
    id result = objc_alloc_init((Class)NSMutableDictionary);
    qword_100039860 = (uint64_t)result;
  }
  return result;
}

- (BOOL)writeConfig
{
  return [(id)qword_100039860 writeToFile:@"/private/var/root/Library/Preferences/com.apple.spaced_repetition.plist" atomically:1];
}

- (int64_t)getNextVerificationEpoch
{
  id v3 = (id)time(0);
  id v4 = [(id)qword_100039860 valueForKey:@"lastVerificationEpoch"];
  id v5 = [(id)qword_100039860 valueForKey:@"verificationEpochStartTime"];
  [(SpacedRepetitionManager *)self setupIntervals];
  if (!v4) {
    return -1;
  }
  id v6 = [v4 integerValue];
  if (v5) {
    id v3 = [v5 integerValue];
  }
  if (v6 < [(id)qword_100039858 count]) {
    return (int64_t)v3 + (int)[(id)[(id)qword_100039858 objectAtIndex:v6] intValue];
  }
  else {
    return -1;
  }
}

- (BOOL)commitNextVerificationEpoch
{
  unint64_t v3 = (int)[(id)qword_100039860 valueForKey:@"lastVerificationEpoch" intValue];
  signed int v4 = [[objc_msgSend((id)qword_100039858, "objectAtIndex:", v3) intValue];
  [(SpacedRepetitionManager *)self setupIntervals];
  if ((unint64_t)[(id)qword_100039858 count] <= v3) {
    return 0;
  }
  unint64_t v5 = v3 + 1;
  [((id)qword_100039860) setObject:+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v5) forKey:@"lastVerificationEpoch"];
  [objc_msgSend((id)qword_100039860, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", time(0) - v4), @"verificationEpochStartTime");
  [(SpacedRepetitionManager *)self writeConfig];
  NSLog(@"advancing verification epoch to %lu", v5);
  return v5 < (unint64_t)[(id)qword_100039858 count];
}

- (int64_t)getSpacedRepetitionTimeout
{
  if (dword_100039850 == 1) {
    return 120;
  }
  else {
    return 518400;
  }
}

- (BOOL)checkForVerificationEpoch
{
  time_t v2 = [(SpacedRepetitionManager *)self getNextVerificationEpoch];
  return v2 >= 1 && time(0) >= v2;
}

- (void)stopSpacedRepetition
{
  [(id)qword_100039860 removeObjectForKey:@"lastVerificationEpoch"];
  [(id)qword_100039860 removeObjectForKey:@"verificationEpochStartTime"];

  [(SpacedRepetitionManager *)self writeConfig];
}

- (BOOL)handleVerificationEpoch
{
  unsigned int v3 = [(SpacedRepetitionManager *)self checkForVerificationEpoch];
  if (!v3) {
    return v3;
  }
  NSLog(@"handling verification epoch");
  int v8 = 0;
  if (!sub_10001B388(0xFFFFFFFFLL, &v8))
  {
    NSLog(@"unable to get device state");
    goto LABEL_7;
  }
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    NSLog(@"biometric state is NOT armed. NOT advancing verification interval.");
    goto LABEL_8;
  }
  if (dword_100039850 == 2)
  {
    NSLog(@"spaced repetition is disabled. NOT performing verification.");
LABEL_8:
    LOBYTE(v3) = 0;
    return v3;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = sub_100004210;
  v18 = sub_100004220;
  signed int v4 = (void *)qword_100039890;
  uint64_t v19 = qword_100039890;
  if (!qword_100039890)
  {
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_10000422C;
    v12 = &unk_100030C78;
    v13 = &v14;
    sub_10000422C((uint64_t)&v9);
    signed int v4 = (void *)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  id v5 = [v4 availableDevices];
  if (![v5 count])
  {
    NSLog(@"could not find a biometric device for verification");
    goto LABEL_8;
  }
  NSLog(@"discarding bio for verification");
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = sub_100004210;
  v18 = sub_100004220;
  id v6 = (void *)qword_1000398A0;
  uint64_t v19 = qword_1000398A0;
  if (!qword_1000398A0)
  {
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_1000043EC;
    v12 = &unk_100030C78;
    v13 = &v14;
    sub_1000043EC((uint64_t)&v9);
    id v6 = (void *)v15[5];
  }
  _Block_object_dispose(&v14, 8);
  unsigned int v3 = [objc_msgSend(objc_msgSend(v6, "deviceWithDescriptor:error:", objc_msgSend(v5, "objectAtIndexedSubscript:", 0), 0), "dropAllUnlockTokensWithError:", 0);
  if (v3)
  {
    if (![(SpacedRepetitionManager *)self commitNextVerificationEpoch]) {
      [(SpacedRepetitionManager *)self stopSpacedRepetition];
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)setupNextTimer
{
  if (dword_100039850 == 2)
  {
    NSLog(@"stopping verification services, spaced repetition mode disabled", a2);
    return 0;
  }
  uint64_t v3 = [(SpacedRepetitionManager *)self getNextVerificationEpoch];
  if (v3 < 1) {
    return 0;
  }
  uint64_t v4 = v3;
  time_t v5 = time(0);
  if (v5 >= [(SpacedRepetitionManager *)self getSpacedRepetitionTimeout] + v4)
  {
    time_t v9 = time(0);
    NSLog(@"spaced repetition has timed out: %lu secs", v9 - v4);
    [(SpacedRepetitionManager *)self stopSpacedRepetition];
    return 0;
  }
  if (dword_100039850 == 1) {
    uint64_t v6 = 20;
  }
  else {
    uint64_t v6 = 60;
  }
  uint64_t v7 = v4 - time(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003F28;
  block[3] = &unk_100030C50;
  if (v6 > v7) {
    uint64_t v7 = v6;
  }
  block[4] = self;
  void block[5] = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  return 1;
}

- (BOOL)repetitionPeriodTimer:(id)a3
{
  int v4 = dword_100039854;
  if (v4 != objc_msgSend(objc_msgSend(a3, "userInfo"), "intValue")) {
    return 0;
  }
  NSLog(@"verification timer[%d] fired", dword_100039854);
  if ([(SpacedRepetitionManager *)self checkForVerificationEpoch]
    && [(SpacedRepetitionManager *)self handleVerificationEpoch])
  {
    NSLog(@"handled verification epoch successfully");
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }
  [(SpacedRepetitionManager *)self setupNextTimer];
  return v5;
}

- (BOOL)beginNewRepetitionPeriod
{
  [(SpacedRepetitionManager *)self setupIntervals];
  [(id)qword_100039860 setObject:&off_1000368B0 forKey:@"lastVerificationEpoch"];
  [((id)qword_100039860) setObject:[+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", time(0))] forKey:@"verificationEpochStartTime"];
  BOOL v3 = [(SpacedRepetitionManager *)self writeConfig];
  if (v3)
  {
    NSLog(@"beginning new verification cycle...");
    LOBYTE(v3) = [(SpacedRepetitionManager *)self setupNextTimer];
  }
  return v3;
}

- (BOOL)continueRepetitionPeriod
{
  [(SpacedRepetitionManager *)self setupIntervals];

  return [(SpacedRepetitionManager *)self setupNextTimer];
}

@end