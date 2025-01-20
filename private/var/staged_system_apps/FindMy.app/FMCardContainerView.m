@interface FMCardContainerView
- (_TtC6FindMy19FMCardContainerView)init;
- (_TtC6FindMy19FMCardContainerView)initWithCoder:(id)a3;
- (_TtC6FindMy19FMCardContainerView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMCardContainerView

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000B230();
}

- (_TtC6FindMy19FMCardContainerView)init
{
  return (_TtC6FindMy19FMCardContainerView *)sub_100014DEC();
}

- (_TtC6FindMy19FMCardContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10045A064();
}

- (_TtC6FindMy19FMCardContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy19FMCardContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy19FMCardContainerView_bluredBackground));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy19FMCardContainerView_grabber);
}

@end