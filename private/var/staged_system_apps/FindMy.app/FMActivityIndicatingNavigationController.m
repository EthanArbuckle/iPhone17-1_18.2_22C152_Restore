@interface FMActivityIndicatingNavigationController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithCoder:(id)a3;
- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithRootViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMActivityIndicatingNavigationController

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithRootViewController:(id)a3
{
  return (_TtC6FindMy40FMActivityIndicatingNavigationController *)sub_1000BE3CC(a3);
}

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithCoder:(id)a3
{
  return (_TtC6FindMy40FMActivityIndicatingNavigationController *)sub_1000BE590(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMActivityIndicatingNavigationController();
  v4 = (char *)v8.receiver;
  [(FMActivityIndicatingNavigationController *)&v8 viewWillAppear:v3];
  v5 = *(void **)&v4[OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_inactiveOverlay];
  id v6 = [self systemBackgroundColor];
  id v7 = [v6 colorWithAlphaComponent:0.6];

  [v5 setBackgroundColor:v7];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMActivityIndicatingNavigationController();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(FMActivityIndicatingNavigationController *)&v9 traitCollectionDidChange:v4];
  id v6 = *(void **)&v5[OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_inactiveOverlay];
  id v7 = [self systemBackgroundColor];
  id v8 = [v7 colorWithAlphaComponent:0.6];

  [v6 setBackgroundColor:v8];
}

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC6FindMy40FMActivityIndicatingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6FindMy40FMActivityIndicatingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy40FMActivityIndicatingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_inactiveOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_activityBarButton));

  swift_bridgeObjectRelease();
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return (*((unsigned char *)&self->super.super.super.super.isa
          + OBJC_IVAR____TtC6FindMy40FMActivityIndicatingNavigationController_operationInProgress) & 1) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000BFC84(v4);

  return self & 1;
}

@end