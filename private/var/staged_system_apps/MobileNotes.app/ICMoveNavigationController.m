@interface ICMoveNavigationController
- (BOOL)canAppearAbovePasswordEntryView;
- (ICMoveNavigationController)initWithCoder:(id)a3;
- (ICMoveNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (ICMoveNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICMoveNavigationController)initWithRootViewController:(id)a3;
- (ICMoveNavigationController)initWithViewControllerManager:(id)a3 sourceObjectIds:(id)a4;
- (ICMoveViewController)moveViewController;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation ICMoveNavigationController

- (ICMoveViewController)moveViewController
{
  return (ICMoveViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                         + OBJC_IVAR___ICMoveNavigationController_moveViewController));
}

- (ICMoveNavigationController)initWithViewControllerManager:(id)a3 sourceObjectIds:(id)a4
{
  sub_100229C2C();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (ICMoveNavigationController *)sub_1003E2FFC(a3, v5);
}

- (ICMoveNavigationController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___ICMoveNavigationController_canAppearAbovePasswordEntryView) = 1;
  id v4 = a3;

  result = (ICMoveNavigationController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)canAppearAbovePasswordEntryView
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  v3 = *(void (**)(void))(*(char **)((char *)&self->super.super.super.super.isa
                                                + OBJC_IVAR___ICMoveNavigationController_moveViewController)
                                     + OBJC_IVAR___ICMoveViewController_completionHandler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_10002E71C((uint64_t)v3);
    v3(0);
    sub_10002E70C((uint64_t)v3);
  }
}

- (ICMoveNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (ICMoveNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICMoveNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (ICMoveNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (ICMoveNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICMoveNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___ICMoveNavigationController_moveViewController));
}

@end