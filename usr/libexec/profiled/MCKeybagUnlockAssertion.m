@interface MCKeybagUnlockAssertion
+ (id)assertionHoldQueue;
+ (void)holdAssertion;
+ (void)releaseAssertion;
- (MCKeybagUnlockAssertion)init;
- (void)dealloc;
@end

@implementation MCKeybagUnlockAssertion

+ (id)assertionHoldQueue
{
  if (qword_100105A80 != -1) {
    dispatch_once(&qword_100105A80, &stru_1000EC480);
  }
  v2 = (void *)qword_100105A78;

  return v2;
}

+ (void)holdAssertion
{
  v2 = [a1 assertionHoldQueue];
  dispatch_async(v2, &stru_1000EC4A0);
}

+ (void)releaseAssertion
{
  v2 = [a1 assertionHoldQueue];
  dispatch_sync(v2, &stru_1000EC4D0);
}

- (MCKeybagUnlockAssertion)init
{
  v4.receiver = self;
  v4.super_class = (Class)MCKeybagUnlockAssertion;
  v2 = [(MCKeybagUnlockAssertion *)&v4 init];
  if (v2) {
    +[MCKeybagUnlockAssertion holdAssertion];
  }
  return v2;
}

- (void)dealloc
{
  +[MCKeybagUnlockAssertion releaseAssertion];
  v3.receiver = self;
  v3.super_class = (Class)MCKeybagUnlockAssertion;
  [(MCKeybagUnlockAssertion *)&v3 dealloc];
}

@end