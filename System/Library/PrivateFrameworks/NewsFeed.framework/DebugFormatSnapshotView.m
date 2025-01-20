@interface DebugFormatSnapshotView
- (_TtC8NewsFeed23DebugFormatSnapshotView)initWithCoder:(id)a3;
- (_TtC8NewsFeed23DebugFormatSnapshotView)initWithFrame:(CGRect)a3;
@end

@implementation DebugFormatSnapshotView

- (_TtC8NewsFeed23DebugFormatSnapshotView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed23DebugFormatSnapshotView_isSelected) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed23DebugFormatSnapshotView_onTap;
  sub_1BFE6CA70(0, (unint64_t *)&qword_1EB871600, MEMORY[0x1E4FAD760]);
  id v7 = objc_allocWithZone(v6);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v7, sel_init);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed23DebugFormatSnapshotView_children) = (Class)MEMORY[0x1E4FBC860];

  result = (_TtC8NewsFeed23DebugFormatSnapshotView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (_TtC8NewsFeed23DebugFormatSnapshotView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed23DebugFormatSnapshotView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end