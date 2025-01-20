@interface AboutCategoriesViewController
- (_TtC10MobileMail29AboutCategoriesViewController)initWithCoder:(id)a3;
- (_TtC10MobileMail29AboutCategoriesViewController)initWithDaemonInterface:(id)a3 presentationSource:(id)a4;
- (_TtC10MobileMail29AboutCategoriesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentingViewControllerForTriageInteraction:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AboutCategoriesViewController

- (_TtC10MobileMail29AboutCategoriesViewController)initWithDaemonInterface:(id)a3 presentationSource:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  return (_TtC10MobileMail29AboutCategoriesViewController *)sub_100247604(a3, (uint64_t)a4);
}

- (_TtC10MobileMail29AboutCategoriesViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100247804();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100247908();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  sub_100248250(v4 & 1);
}

- (_TtC10MobileMail29AboutCategoriesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (_TtC10MobileMail29AboutCategoriesViewController *)sub_10024BE14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29AboutCategoriesViewController_daemonInterface));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail29AboutCategoriesViewController_provider));
  sub_10022FCDC();
}

- (id)presentingViewControllerForTriageInteraction:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v9 = sub_10024C074();

  return v9;
}

@end