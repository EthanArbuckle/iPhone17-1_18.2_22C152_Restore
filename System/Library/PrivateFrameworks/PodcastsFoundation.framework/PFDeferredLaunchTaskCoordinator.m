@interface PFDeferredLaunchTaskCoordinator
+ (PFDeferredLaunchTaskCoordinator)sharedInstance;
- (PFDeferredLaunchTaskCoordinator)init;
- (void)deferWork:(id)a3;
- (void)deferWorkOnQueue:(id)a3 withBlock:(id)a4;
- (void)scheduleDefaultDeferralDeadline;
- (void)scheduleDeferralDeadlineAfter:(double)a3;
- (void)stopDeferring;
@end

@implementation PFDeferredLaunchTaskCoordinator

+ (PFDeferredLaunchTaskCoordinator)sharedInstance
{
  if (qword_1EB76CBA0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB76CB90;
  return (PFDeferredLaunchTaskCoordinator *)v2;
}

- (PFDeferredLaunchTaskCoordinator)init
{
  return (PFDeferredLaunchTaskCoordinator *)DeferredLaunchTaskCoordinator.init()();
}

- (void)scheduleDeferralDeadlineAfter:(double)a3
{
  v4 = self;
  sub_1ACCC5714(a3);
}

- (void)scheduleDefaultDeferralDeadline
{
  swift_beginAccess();
  double v3 = *(double *)&qword_1E99F4EC0;
  v4 = self;
  sub_1ACCC5714(v3);
}

- (void)deferWorkOnQueue:(id)a3 withBlock:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_1ACCC60D4(a3, (uint64_t)sub_1ACCC7D10, v7);

  swift_release();
}

- (void)deferWork:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_1ACCC60D4(0, (uint64_t)sub_1ACC44E60, v5);

  swift_release();
}

- (void)stopDeferring
{
  v2 = self;
  sub_1ACCC6890();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end