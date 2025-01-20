@interface STSummaryCellViewController
- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithCoder:(id)a3;
- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4;
- (void)updateWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation STSummaryCellViewController

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  if (a3) {
    sub_225C08420();
  }
  sub_225C079F0();
  swift_allocObject();
  v5 = self;
  *(Class *)((char *)&v5->super.super.super.isa
           + OBJC_IVAR____TtC20ScreenTimeSettingsUI27STSummaryCellViewController_bridge) = (Class)sub_225C079D0();

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for STSummaryCellViewController();
  return [(STSummaryCellViewController *)&v7 initWithNibName:0 bundle:0];
}

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithCoder:(id)a3
{
  result = (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController *)sub_225C087D0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_225BE3044();
}

- (void)updateWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  if (a3)
  {
    sub_225C08420();
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a4) {
LABEL_3:
  }
    sub_225C08420();
LABEL_4:
  swift_bridgeObjectRetain();
  v6 = self;
  sub_225C079E0();

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end