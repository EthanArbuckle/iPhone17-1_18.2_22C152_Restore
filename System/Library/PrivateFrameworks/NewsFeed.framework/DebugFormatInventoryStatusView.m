@interface DebugFormatInventoryStatusView
- (_TtC8NewsFeed30DebugFormatInventoryStatusView)init;
- (_TtC8NewsFeed30DebugFormatInventoryStatusView)initWithCoder:(id)a3;
- (_TtC8NewsFeed30DebugFormatInventoryStatusView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatInventoryStatusView

- (_TtC8NewsFeed30DebugFormatInventoryStatusView)init
{
  return (_TtC8NewsFeed30DebugFormatInventoryStatusView *)sub_1C094E68C();
}

- (_TtC8NewsFeed30DebugFormatInventoryStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C094F1CC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C094EE18();
}

- (_TtC8NewsFeed30DebugFormatInventoryStatusView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed30DebugFormatInventoryStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInventoryStatusView_onErrorTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInventoryStatusView_errorButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInventoryStatusView_onChangesTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInventoryStatusView_changesButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed30DebugFormatInventoryStatusView_activityIndicatorView));
  swift_bridgeObjectRelease();
}

@end