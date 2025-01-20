@interface RoundedPlatterView
- (_TtC9SeymourUIP33_C666C579EAAF2160522BD5D4777B64BB18RoundedPlatterView)initWithCoder:(id)a3;
- (_TtC9SeymourUIP33_C666C579EAAF2160522BD5D4777B64BB18RoundedPlatterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RoundedPlatterView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedPlatterView();
  id v2 = v5.receiver;
  [(RoundedPlatterView *)&v5 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);
}

- (_TtC9SeymourUIP33_C666C579EAAF2160522BD5D4777B64BB18RoundedPlatterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedPlatterView();
  return -[RoundedPlatterView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUIP33_C666C579EAAF2160522BD5D4777B64BB18RoundedPlatterView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedPlatterView();
  return [(RoundedPlatterView *)&v5 initWithCoder:a3];
}

@end