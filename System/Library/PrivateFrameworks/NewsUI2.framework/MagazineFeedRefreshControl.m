@interface MagazineFeedRefreshControl
- (_TtC7NewsUI226MagazineFeedRefreshControl)init;
- (_TtC7NewsUI226MagazineFeedRefreshControl)initWithCoder:(id)a3;
- (_TtC7NewsUI226MagazineFeedRefreshControl)initWithFrame:(CGRect)a3;
- (void)handleRefresh;
- (void)layoutSubviews;
@end

@implementation MagazineFeedRefreshControl

- (_TtC7NewsUI226MagazineFeedRefreshControl)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI226MagazineFeedRefreshControl *)sub_1DEC9C77C();
}

- (_TtC7NewsUI226MagazineFeedRefreshControl)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI226MagazineFeedRefreshControl_messageLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI226MagazineFeedRefreshControl *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1DEC9C5B8();
}

- (void)handleRefresh
{
}

- (_TtC7NewsUI226MagazineFeedRefreshControl)init
{
  result = (_TtC7NewsUI226MagazineFeedRefreshControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedRefreshControl_messageLabel));
}

@end