@interface FMLostModeSummaryToggleView
- (_TtC6FindMy27FMLostModeSummaryToggleView)init;
- (_TtC6FindMy27FMLostModeSummaryToggleView)initWithCoder:(id)a3;
- (void)labelTapped:(id)a3;
@end

@implementation FMLostModeSummaryToggleView

- (_TtC6FindMy27FMLostModeSummaryToggleView)init
{
  return (_TtC6FindMy27FMLostModeSummaryToggleView *)sub_100387DBC();
}

- (_TtC6FindMy27FMLostModeSummaryToggleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100388A5C();
}

- (void)labelTapped:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100388B50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_toggle));
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy27FMLostModeSummaryToggleView_delegate;

  sub_100068760((uint64_t)v3);
}

@end