@interface PlayButton
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC8AppStore10PlayButton)init;
- (_TtC8AppStore10PlayButton)initWithCoder:(id)a3;
- (_TtC8AppStore10PlayButton)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
@end

@implementation PlayButton

- (_TtC8AppStore10PlayButton)init
{
  return (_TtC8AppStore10PlayButton *)sub_1006221CC();
}

- (_TtC8AppStore10PlayButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100622780();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  if (result.height < result.width) {
    result.double width = result.height;
  }
  if (result.width > 60.0) {
    result.double width = 60.0;
  }
  if (result.width <= 31.0) {
    result.double width = 0.0;
  }
  double width = result.width;
  result.height = width;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006224B4();
}

- (void)didTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore10PlayButton_tapActionBlock);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (_TtC8AppStore10PlayButton)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore10PlayButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore10PlayButton_tapActionBlock));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore10PlayButton_tapGestureRecognizer);
}

@end