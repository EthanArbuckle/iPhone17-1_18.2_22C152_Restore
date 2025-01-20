@interface SessionOverlayPlatterView
- (_TtC9SeymourUI25SessionOverlayPlatterView)initWithCoder:(id)a3;
- (void)layoutSubviews;
@end

@implementation SessionOverlayPlatterView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionOverlayPlatterView();
  id v2 = v5.receiver;
  [(SessionOverlayPlatterView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);
}

- (_TtC9SeymourUI25SessionOverlayPlatterView)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI25SessionOverlayPlatterView *)sub_23A800DD8();
  __break(1u);
  return result;
}

@end