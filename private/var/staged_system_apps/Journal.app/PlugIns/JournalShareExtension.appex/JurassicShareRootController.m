@interface JurassicShareRootController
- (JurassicShareRootController)initWithCoder:(id)a3;
- (JurassicShareRootController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (JurassicShareRootController)initWithNibName:(id)a3 bundle:(id)a4;
- (JurassicShareRootController)initWithRootViewController:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)viewDidLoad;
@end

@implementation JurassicShareRootController

- (JurassicShareRootController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100109D30();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (JurassicShareRootController *)sub_100067234(v5, v7, a4);
}

- (JurassicShareRootController)initWithCoder:(id)a3
{
  result = (JurassicShareRootController *)sub_10010AA60();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100067438();
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  uint64_t v6 = self;
  id v7 = a3;
  sub_1000DB7DC(v6, (uint64_t)sub_100067AA8, v5);

  swift_release();
}

- (JurassicShareRootController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (JurassicShareRootController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (JurassicShareRootController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (JurassicShareRootController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end