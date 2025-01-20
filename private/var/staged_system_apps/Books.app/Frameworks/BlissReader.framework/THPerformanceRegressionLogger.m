@interface THPerformanceRegressionLogger
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedLogger;
+ (void)logEventWithBlock:(id)a3;
- (THPerformanceRegressionLogger)init;
- (id)bookDescriptionForContext:(id)a3;
- (id)orientation;
- (id)testName;
- (unint64_t)microseconds;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)log:(id)a3;
- (void)logEvent:(id)a3 forAsset:(id)a4;
- (void)logEvent:(id)a3 forAssetName:(id)a4;
- (void)logEvent:(id)a3 forBookDescription:(id)a4;
- (void)logEvent:(id)a3 forContentNode:(id)a4;
- (void)logEvent:(id)a3 forObjectContext:(id)a4;
@end

@implementation THPerformanceRegressionLogger

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___THPerformanceRegressionLogger;
  return [super allocWithZone:0];
}

+ (id)sharedLogger
{
  id result = (id)qword_5732D0;
  if (!qword_5732D0)
  {
    objc_sync_enter(a1);
    if (!qword_5732D0)
    {
      id v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5732D0 = (uint64_t)v4;
      if (!v4) {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[THPerformanceRegressionLogger sharedLogger]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THPerformanceRegressionLogger.m") lineNumber:27 description:@"Couldn't create singleton instance of %@", a1];
      }
    }
    objc_sync_exit(a1);
    return (id)qword_5732D0;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (THPerformanceRegressionLogger)init
{
  v7.receiver = self;
  v7.super_class = (Class)THPerformanceRegressionLogger;
  v2 = [(THPerformanceRegressionLogger *)&v7 init];
  if (v2)
  {
    v2->mShouldLog = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"THPerformanceRegressionLogging"];
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v4) = info.numer;
    v2->mDivisor = (double)v3 / (double)v4 * 1000.0;
    if (v2->mShouldLog)
    {
      memset(&v8, 0, 512);
      uname(&v8);
      v2->mMachine = (NSString *)[objc_alloc((Class)NSString) initWithCString:v8.machine encoding:1];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THPerformanceRegressionLogger;
  [(THPerformanceRegressionLogger *)&v3 dealloc];
}

- (unint64_t)microseconds
{
  return vcvtmd_u64_f64((double)mach_absolute_time() / self->mDivisor + 0.5);
}

- (void)log:(id)a3
{
  if (self->mShouldLog) {
    NSLog(@"%@", a2, a3);
  }
}

- (id)orientation
{
  if ((char *)[(UIWindowScene *)[(UIWindow *)[+[UIApplication sharedApplication] keyWindow] windowScene] interfaceOrientation]- 1 >= (unsigned char *)&dword_0 + 2)return @"landscape"; {
  else
  }
    return @"portrait";
}

- (id)bookDescriptionForContext:(id)a3
{
  objc_opt_class();
  [a3 documentObject];
  id result = (id)TSUDynamicCast();
  if (result)
  {
    return [result bookDescription];
  }
  return result;
}

- (id)testName
{
  id result = [+[NSUserDefaults standardUserDefaults] stringForKey:@"THPerformanceRegressionTestName"];
  if (!result) {
    return @"setup";
  }
  return result;
}

- (void)logEvent:(id)a3 forAssetName:(id)a4
{
  if (self->mShouldLog)
  {
    v5 = +[NSString stringWithFormat:@"perfEvent={\"test\":\"%@\",\"event\":\"%@\",\"time\":%qu,\"asset\":\"%@\",\"orientation\":\"%@\",\"machine\":\"%@\"}", [(THPerformanceRegressionLogger *)self testName], a3, [(THPerformanceRegressionLogger *)self microseconds], a4, [(THPerformanceRegressionLogger *)self orientation], self->mMachine];
    [(THPerformanceRegressionLogger *)self log:v5];
  }
}

- (void)logEvent:(id)a3 forBookDescription:(id)a4
{
  if (self->mShouldLog)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"perfEvent={\"test\":\"%@\",\"event\":\"%@\",\"time\":%qu,\"asset\":\"%@\",\"orientation\":\"%@\",\"machine\":\"%@\",\"title\":\"%@\"}", -[THPerformanceRegressionLogger testName](self, "testName"), a3, -[THPerformanceRegressionLogger microseconds](self, "microseconds"), objc_msgSend(objc_msgSend(objc_msgSend(a4, "asset"), "url"), "lastPathComponent"), -[THPerformanceRegressionLogger orientation](self, "orientation"), self->mMachine, objc_msgSend(a4, "bookTitle"));
    [(THPerformanceRegressionLogger *)self log:v5];
  }
}

- (void)logEvent:(id)a3 forAsset:(id)a4
{
  if (self->mShouldLog)
  {
    id v6 = [a4 lastPathComponent];
    [(THPerformanceRegressionLogger *)self logEvent:a3 forAssetName:v6];
  }
}

- (void)logEvent:(id)a3 forObjectContext:(id)a4
{
  if (self->mShouldLog)
  {
    id v6 = [(THPerformanceRegressionLogger *)self bookDescriptionForContext:a4];
    [(THPerformanceRegressionLogger *)self logEvent:a3 forBookDescription:v6];
  }
}

- (void)logEvent:(id)a3 forContentNode:(id)a4
{
  if (self->mShouldLog)
  {
    id v7 = -[THPerformanceRegressionLogger bookDescriptionForContext:](self, "bookDescriptionForContext:", [a4 context]);
    utsname v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"perfEvent={\"test\":\"%@\",\"event\":\"%@\",\"time\":%qu,\"node\":\"%@\",\"asset\":\"%@\",\"orientation\":\"%@\",\"machine\":\"%@\",\"title\":\"%@\"}", -[THPerformanceRegressionLogger testName](self, "testName"), a3, -[THPerformanceRegressionLogger microseconds](self, "microseconds"), [a4 applePubRelativePath], objc_msgSend(objc_msgSend(objc_msgSend(v7, "asset"), "url"), "lastPathComponent"), -[THPerformanceRegressionLogger orientation](self, "orientation"), self->mMachine, objc_msgSend(v7, "bookTitle"));
    [(THPerformanceRegressionLogger *)self log:v8];
  }
}

+ (void)logEventWithBlock:(id)a3
{
  unint64_t v4 = [a1 sharedLogger];
  if (v4 && v4[8])
  {
    v5 = (void (*)(id, unsigned char *))*((void *)a3 + 2);
    v5(a3, v4);
  }
}

@end