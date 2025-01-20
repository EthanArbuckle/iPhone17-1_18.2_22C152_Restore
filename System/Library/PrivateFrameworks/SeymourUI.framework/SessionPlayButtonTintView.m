@interface SessionPlayButtonTintView
- (_TtC9SeymourUI25SessionPlayButtonTintView)initWithCoder:(id)a3;
- (_TtC9SeymourUI25SessionPlayButtonTintView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionPlayButtonTintView

- (_TtC9SeymourUI25SessionPlayButtonTintView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI25SessionPlayButtonTintView *)sub_239F26234(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI25SessionPlayButtonTintView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI25SessionPlayButtonTintView_gradientLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F157D0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI25SessionPlayButtonTintView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SessionPlayButtonTintView();
  v2 = (char *)v4.receiver;
  [(SessionPlayButtonTintView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI25SessionPlayButtonTintView_gradientLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25SessionPlayButtonTintView_gradientLayer));
}

@end