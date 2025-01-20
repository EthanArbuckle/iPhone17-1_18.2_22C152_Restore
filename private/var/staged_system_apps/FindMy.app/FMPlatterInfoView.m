@interface FMPlatterInfoView
- (_TtC6FindMy17FMPlatterInfoView)initWithCoder:(id)a3;
- (_TtC6FindMy17FMPlatterInfoView)initWithFrame:(CGRect)a3;
- (void)handleCloseAction;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMPlatterInfoView

- (_TtC6FindMy17FMPlatterInfoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002C5A4C();
}

- (void)handleCloseAction
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002C5460((uint64_t)a3);
}

- (_TtC6FindMy17FMPlatterInfoView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy17FMPlatterInfoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1002C5988((uint64_t)self + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_platterIcon);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_chevronWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_titleTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_subtitleTrailingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_closeButton);
}

@end