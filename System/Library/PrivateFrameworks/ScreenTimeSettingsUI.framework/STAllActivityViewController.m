@interface STAllActivityViewController
- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithCoder:(id)a3;
- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4;
- (void)updateWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation STAllActivityViewController

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (!a3)
  {
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_225C08420();
  if (a4) {
LABEL_3:
  }
    sub_225C08420();
LABEL_5:
  sub_225C07A90();
  swift_allocObject();
  v8 = self;
  *(Class *)((char *)&v8->super.super.super.isa
           + OBJC_IVAR____TtC20ScreenTimeSettingsUI27STAllActivityViewController_bridge) = (Class)sub_225C07A80();

  v10.receiver = v8;
  v10.super_class = ObjectType;
  return [(STAllActivityViewController *)&v10 initWithNibName:0 bundle:0];
}

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithCoder:(id)a3
{
  result = (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)sub_225C087D0();
  __break(1u);
  return result;
}

- (void)updateWithUserAltDSID:(id)a3 deviceIdentifier:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268116750);
  MEMORY[0x270FA5388](v7 - 8, v8);
  objc_super v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a3)
  {
    if (!a4) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_225C08420();
  if (a4) {
LABEL_3:
  }
    sub_225C08420();
LABEL_5:
  swift_bridgeObjectRetain();
  v11 = self;
  swift_bridgeObjectRetain();
  sub_225C07A50();
  uint64_t v12 = sub_225C07A60();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 0, 1, v12);
  sub_225C07A70();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  STAllActivityViewController.viewDidLoad()();
}

- (_TtC20ScreenTimeSettingsUI27STAllActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC20ScreenTimeSettingsUI27STAllActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end