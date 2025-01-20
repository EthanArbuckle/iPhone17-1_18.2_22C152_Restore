@interface FolderComposerJoinCell
- (_TtC11MobileNotes22FolderComposerJoinCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes22FolderComposerJoinCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FolderComposerJoinCell

- (_TtC11MobileNotes22FolderComposerJoinCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC11MobileNotes22FolderComposerJoinCell____lazy_storage___buttonHorizontalMargin;
  *(void *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes22FolderComposerJoinCell____lazy_storage___textView) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FolderComposerJoinCell();
  v8 = -[FolderComposerJoinCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_100031418(0, (unint64_t *)&qword_10069C280);
  v9 = v8;
  static UITraitCollection.traitsAffectingSizeAndColor.getter();
  UIView.registerForTraitChanges(_:action:)();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC11MobileNotes22FolderComposerJoinCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes22FolderComposerJoinCell *)sub_100226628(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100226734();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes22FolderComposerJoinCell____lazy_storage___textView));
}

@end