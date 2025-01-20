@interface IndefiniteSpinnerView
- (_TtC9SeymourUI21IndefiniteSpinnerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21IndefiniteSpinnerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation IndefiniteSpinnerView

- (_TtC9SeymourUI21IndefiniteSpinnerView)initWithCoder:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_layout) = xmmword_23A8182F0;
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_spinnerLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F15880]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_isAnimating) = 0;
  uint64_t v8 = OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_rotationAnimation;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)sub_239E7BCA4();

  result = (_TtC9SeymourUI21IndefiniteSpinnerView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239E7C0B8();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_239E7C350();
}

- (_TtC9SeymourUI21IndefiniteSpinnerView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI21IndefiniteSpinnerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_spinnerLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21IndefiniteSpinnerView_rotationAnimation);
}

@end