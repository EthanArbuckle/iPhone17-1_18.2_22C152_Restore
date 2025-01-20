@interface SetupBaseViewController
- (_TtC21MediaSetupViewService23SetupBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC21MediaSetupViewService23SetupBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)requestDismiss;
@end

@implementation SetupBaseViewController

- (void)requestDismiss
{
  v2 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC21MediaSetupViewService23SetupBaseViewController_mainController];
  v3 = self;
  id v4 = v2;
  sub_100013D0C(1);
}

- (_TtC21MediaSetupViewService23SetupBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC21MediaSetupViewService23SetupBaseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC21MediaSetupViewService23SetupBaseViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC21MediaSetupViewService23SetupBaseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end