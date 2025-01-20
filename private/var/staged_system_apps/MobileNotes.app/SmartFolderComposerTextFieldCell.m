@interface SmartFolderComposerTextFieldCell
- (_TtC11MobileNotes32SmartFolderComposerTextFieldCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes32SmartFolderComposerTextFieldCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)textFieldDidChange:(id)a3;
@end

@implementation SmartFolderComposerTextFieldCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10042455C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100424200(v4);
}

- (_TtC11MobileNotes32SmartFolderComposerTextFieldCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell____lazy_storage___textField) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SmartFolderComposerTextFieldCell();
  return -[SmartFolderComposerTextFieldCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes32SmartFolderComposerTextFieldCell)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange);
  *id v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell____lazy_storage___textField) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SmartFolderComposerTextFieldCell();
  return [(SmartFolderComposerTextFieldCell *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell_textDidChange));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes32SmartFolderComposerTextFieldCell____lazy_storage___textField);
}

@end