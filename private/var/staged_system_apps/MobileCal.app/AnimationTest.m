@interface AnimationTest
+ (id)_animationSubTestName;
+ (id)_delaySubTestName;
- (id)notificationName;
- (void)_animationCompleted;
- (void)dealloc;
- (void)kickOffAnimation;
- (void)runTest;
- (void)setUp;
@end

@implementation AnimationTest

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AnimationTest;
  [(AnimationTest *)&v4 dealloc];
}

+ (id)_delaySubTestName
{
  return @"Delay";
}

+ (id)_animationSubTestName
{
  return @"Animation";
}

- (void)runTest
{
  [(AnimationTest *)self setUp];
  dispatch_time_t v3 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F484;
  block[3] = &unk_1001D2740;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_animationCompleted
{
  dispatch_time_t v3 = [(ApplicationTest *)self application];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F6EC;
  v4[3] = &unk_1001D2740;
  v4[4] = self;
  [v3 installCACommitCompletionBlock:v4];
}

- (id)notificationName
{
  return 0;
}

- (void)setUp
{
  objc_opt_class();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

- (void)kickOffAnimation
{
  objc_opt_class();
  sub_10004E834();

  NSRequestConcreteImplementation();
}

@end