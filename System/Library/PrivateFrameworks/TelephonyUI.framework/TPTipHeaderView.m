@interface TPTipHeaderView
- (_TtC11TelephonyUI15TPTipHeaderView)initWithCoder:(id)a3;
- (_TtC11TelephonyUI15TPTipHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation TPTipHeaderView

- (_TtC11TelephonyUI15TPTipHeaderView)initWithCoder:(id)a3
{
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_separatorEdgeInset);
  uint64_t v5 = MEMORY[0x1E4FB2848];
  _OWORD *v4 = *MEMORY[0x1E4FB2848];
  v4[1] = *(_OWORD *)(v5 + 16);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_displaysBottomSeparator) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView) = 0;
  id v6 = a3;

  result = (_TtC11TelephonyUI15TPTipHeaderView *)sub_1C2F6E598();
  __break(1u);
  return result;
}

- (_TtC11TelephonyUI15TPTipHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC11TelephonyUI15TPTipHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_bottomSeparatorView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11TelephonyUI15TPTipHeaderView_hostingView);
}

@end