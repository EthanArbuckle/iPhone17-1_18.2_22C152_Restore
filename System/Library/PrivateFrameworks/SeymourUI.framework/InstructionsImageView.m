@interface InstructionsImageView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI21InstructionsImageView)init;
- (_TtC9SeymourUI21InstructionsImageView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21InstructionsImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InstructionsImageView

- (_TtC9SeymourUI21InstructionsImageView)init
{
  return (_TtC9SeymourUI21InstructionsImageView *)sub_239F13674();
}

- (_TtC9SeymourUI21InstructionsImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F13C00();
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for InstructionsImageView();
  id v2 = v10.receiver;
  [(InstructionsImageView *)&v10 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v10.receiver, v10.super_class);
  objc_msgSend(v2, sel_bounds);
  id v8 = objc_msgSend(self, sel_bezierPathWithRoundedRect_cornerRadius_, v4, v5, v6, v7, 20.0);
  id v9 = objc_msgSend(v8, sel_CGPath);

  objc_msgSend(v3, sel_setShadowPath_, v9);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 410.0;
  double v3 = 231.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC9SeymourUI21InstructionsImageView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI21InstructionsImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end