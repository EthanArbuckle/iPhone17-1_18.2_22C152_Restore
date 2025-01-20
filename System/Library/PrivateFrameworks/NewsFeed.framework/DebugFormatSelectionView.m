@interface DebugFormatSelectionView
- (_TtC8NewsFeed24DebugFormatSelectionView)initWithCoder:(id)a3;
- (_TtC8NewsFeed24DebugFormatSelectionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DebugFormatSelectionView

- (_TtC8NewsFeed24DebugFormatSelectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1401544();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C1400E34();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1C1401138((uint64_t)a3);
}

- (_TtC8NewsFeed24DebugFormatSelectionView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed24DebugFormatSelectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_topLeftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_topRightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_bottomLeftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_bottomRightView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed24DebugFormatSelectionView_borderView);
}

@end