@interface CRLiOSPrintOptionsViewController
- (NSString)summary;
- (UIPrintInfo)printInfo;
- (_TtC8Freeform32CRLiOSPrintOptionsViewController)initWithCoder:(id)a3;
- (_TtC8Freeform32CRLiOSPrintOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setPrintInfo:(id)a3;
- (void)setSummary:(id)a3;
- (void)viewDidLoad;
@end

@implementation CRLiOSPrintOptionsViewController

- (UIPrintInfo)printInfo
{
  return (UIPrintInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo));
}

- (void)setPrintInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo) = (Class)a3;
  id v3 = a3;
}

- (NSString)summary
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setSummary:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_summary);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform32CRLiOSPrintOptionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100BA2604();
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_100B9F868();
}

- (_TtC8Freeform32CRLiOSPrintOptionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8Freeform32CRLiOSPrintOptionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printInfo));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_printRenderer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLiOSPrintOptionsViewController_hostingController));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end