@interface SmartFolderComposerSwitchCell
- (_TtC11MobileNotes29SmartFolderComposerSwitchCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes29SmartFolderComposerSwitchCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)onDidChangeWithSender:(id)a3;
@end

@implementation SmartFolderComposerSwitchCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1004B0444();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)onDidChangeWithSender:(id)a3
{
  uint64_t v6 = self;
  if (a3) {
    id v4 = [a3 isOn];
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = *(void (**)(id))((char *)&v6->super.super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange);
  if (v5)
  {
    swift_retain();
    v5(v4);
    sub_10002E70C((uint64_t)v5);
  }
}

- (_TtC11MobileNotes29SmartFolderComposerSwitchCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange);
  *uint64_t v9 = 0;
  v9[1] = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_text);
  void *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell____lazy_storage___switchView) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[SmartFolderComposerSwitchCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes29SmartFolderComposerSwitchCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange);
  *uint64_t v6 = 0;
  v6[1] = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_text);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell____lazy_storage___switchView) = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(SmartFolderComposerSwitchCell *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell_onDidChange));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes29SmartFolderComposerSwitchCell____lazy_storage___switchView);
}

@end