@interface ICDebugStatusRootViewController
- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController)initWithCoder:(id)a3;
- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ICDebugStatusRootViewController

- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController_rootView) = 0;
  id v4 = a3;

  result = (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  v2 = self;
  sub_100219B18();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_10021A0F4(a3);
}

- (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotesP33_679C7337F26BC959ACC0954CE78EECC431ICDebugStatusRootViewController_rootView);
}

@end