@interface RoundedIconView
- (_TtC9SeymourUI15RoundedIconView)initWithCoder:(id)a3;
- (_TtC9SeymourUI15RoundedIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation RoundedIconView

- (_TtC9SeymourUI15RoundedIconView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI15RoundedIconView *)sub_23A1D86B8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI15RoundedIconView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9SeymourUI15RoundedIconView_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x263F82828]);
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI15RoundedIconView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RoundedIconView();
  id v2 = v4.receiver;
  [(RoundedIconView *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedIconView();
  id v2 = (char *)v5.receiver;
  [(RoundedIconView *)&v5 tintColorDidChange];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI15RoundedIconView_imageView];
  id v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setTintColor_, v4);
}

- (void).cxx_destruct
{
}

@end