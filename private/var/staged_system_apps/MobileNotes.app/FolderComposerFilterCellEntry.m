@interface FolderComposerFilterCellEntry
- (_TtC11MobileNotes29FolderComposerFilterCellEntry)initWithCoder:(id)a3;
- (_TtC11MobileNotes29FolderComposerFilterCellEntry)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)layoutSubviews;
@end

@implementation FolderComposerFilterCellEntry

- (void)layoutSubviews
{
  v2 = self;
  sub_10025886C();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100258B6C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11MobileNotes29FolderComposerFilterCellEntry)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_leadingText);
  void *v7 = 0;
  v7[1] = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_trailingText);
  void *v8 = 0;
  v8[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_showDisclosure) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for FolderComposerFilterCellEntry();
  return -[FolderComposerFilterCellEntry initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes29FolderComposerFilterCellEntry)initWithCoder:(id)a3
{
  uint64_t v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_leadingText);
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_trailingText);
  *uint64_t v5 = 0;
  v5[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes29FolderComposerFilterCellEntry_showDisclosure) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FolderComposerFilterCellEntry();
  return [(FolderComposerFilterCellEntry *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end