@interface DurationFilterTickView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI22DurationFilterTickView)initWithCoder:(id)a3;
- (_TtC9SeymourUI22DurationFilterTickView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation DurationFilterTickView

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_layout);
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_23A4FE250(x, y, width, height);
}

- (_TtC9SeymourUI22DurationFilterTickView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_layout;
  v8 = self;
  sub_23A4FECA4((double *)v12);
  long long v9 = v12[1];
  *(_OWORD *)v7 = v12[0];
  *((_OWORD *)v7 + 1) = v9;
  *((void *)v7 + 4) = v13;
  *((unsigned char *)&v8->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_state) = 0;

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for DurationFilterTickView();
  return -[DurationFilterTickView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI22DurationFilterTickView)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_layout;
  id v5 = a3;
  v6 = self;
  sub_23A4FECA4((double *)v11);
  long long v7 = v11[1];
  *(_OWORD *)v4 = v11[0];
  *((_OWORD *)v4 + 1) = v7;
  *((void *)v4 + 4) = v12;
  *((unsigned char *)&v6->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI22DurationFilterTickView_state) = 0;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for DurationFilterTickView();
  v8 = [(DurationFilterTickView *)&v10 initWithCoder:v5];

  return v8;
}

@end