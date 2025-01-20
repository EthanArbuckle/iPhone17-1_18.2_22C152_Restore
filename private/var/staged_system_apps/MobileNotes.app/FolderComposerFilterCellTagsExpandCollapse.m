@interface FolderComposerFilterCellTagsExpandCollapse
- (_TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse)initWithCoder:(id)a3;
- (_TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FolderComposerFilterCellTagsExpandCollapse

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100250474((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse_hiddenTagCount) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerFilterCellTagsExpandCollapse();
  return -[FolderComposerFilterCellTagsExpandCollapse initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes42FolderComposerFilterCellTagsExpandCollapse_hiddenTagCount) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FolderComposerFilterCellTagsExpandCollapse();
  return [(FolderComposerFilterCellTagsExpandCollapse *)&v5 initWithCoder:a3];
}

@end