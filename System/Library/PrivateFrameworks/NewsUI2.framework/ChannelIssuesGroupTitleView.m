@interface ChannelIssuesGroupTitleView
- (_TtC7NewsUI227ChannelIssuesGroupTitleView)initWithCoder:(id)a3;
- (_TtC7NewsUI227ChannelIssuesGroupTitleView)initWithFrame:(CGRect)a3;
@end

@implementation ChannelIssuesGroupTitleView

- (_TtC7NewsUI227ChannelIssuesGroupTitleView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI227ChannelIssuesGroupTitleView *)sub_1DF354178(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI227ChannelIssuesGroupTitleView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI227ChannelIssuesGroupTitleView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI227ChannelIssuesGroupTitleView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI227ChannelIssuesGroupTitleView_titleLabel));
}

@end