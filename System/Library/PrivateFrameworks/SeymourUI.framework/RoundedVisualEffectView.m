@interface RoundedVisualEffectView
- (_TtC9SeymourUI23RoundedVisualEffectView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23RoundedVisualEffectView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation RoundedVisualEffectView

- (_TtC9SeymourUI23RoundedVisualEffectView)initWithEffect:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedVisualEffectView();
  id v4 = a3;
  v5 = [(RoundedVisualEffectView *)&v8 initWithEffect:v4];
  -[RoundedVisualEffectView setClipsToBounds:](v5, sel_setClipsToBounds_, 1, v8.receiver, v8.super_class);
  id v6 = [(RoundedVisualEffectView *)v5 layer];

  objc_msgSend(v6, sel_setCornerCurve_, *MEMORY[0x263F15A20]);
  return v5;
}

- (_TtC9SeymourUI23RoundedVisualEffectView)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI23RoundedVisualEffectView *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RoundedVisualEffectView();
  id v2 = v4.receiver;
  [(RoundedVisualEffectView *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, CGRectGetHeight(v5) * 0.5);
}

@end