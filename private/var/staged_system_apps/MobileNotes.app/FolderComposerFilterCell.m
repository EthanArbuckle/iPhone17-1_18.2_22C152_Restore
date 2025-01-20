@interface FolderComposerFilterCell
- (NSString)accessibilityValue;
- (_TtC11MobileNotes24FolderComposerFilterCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes24FolderComposerFilterCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)updateConstraints;
@end

@implementation FolderComposerFilterCell

- (_TtC11MobileNotes24FolderComposerFilterCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes24FolderComposerFilterCell *)sub_1004A7E48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes24FolderComposerFilterCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes24FolderComposerFilterCell *)sub_1004A7FB0(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1004A810C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)updateConstraints
{
  v2 = self;
  sub_1004A947C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_accountObjectID));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_filterTypeSelection));
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_filterTypeSelectionDidChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_horizontalStackViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell_listContentViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___listContentView));
  sub_1004A9934(*(id *)((char *)&self->super.super.super.super.super.super.isa
                      + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___image));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes24FolderComposerFilterCell____lazy_storage___menuLabel);
}

- (NSString)accessibilityValue
{
  v2 = self;
  id v3 = sub_1004A7D70();
  NSString v4 = [v3 text];

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
  }

  return (NSString *)v4;
}

@end