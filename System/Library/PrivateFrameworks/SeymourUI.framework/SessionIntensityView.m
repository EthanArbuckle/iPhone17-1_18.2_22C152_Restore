@interface SessionIntensityView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI20SessionIntensityView)initWithCoder:(id)a3;
- (_TtC9SeymourUI20SessionIntensityView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionIntensityView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionIntensityView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionIntensityView();
  v2 = (char *)v5.receiver;
  [(SessionIntensityView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI20SessionIntensityView_label];
  objc_msgSend(v3, sel_sizeToFit, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  double Width = CGRectGetWidth(v6);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0, Width, CGRectGetHeight(v7));
}

- (_TtC9SeymourUI20SessionIntensityView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A388548();
}

- (_TtC9SeymourUI20SessionIntensityView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI20SessionIntensityView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20SessionIntensityView_label);
}

@end