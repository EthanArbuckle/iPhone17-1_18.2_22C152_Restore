@interface BeatingHeartView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9SeymourUI16BeatingHeartView)initWithCoder:(id)a3;
- (_TtC9SeymourUI16BeatingHeartView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BeatingHeartView

- (_TtC9SeymourUI16BeatingHeartView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16BeatingHeartView *)sub_23A7DD104(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16BeatingHeartView_imageView), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[BeatingHeartView sizeThatFits:](self, sel_sizeThatFits_, 0.0, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BeatingHeartView();
  double v2 = (char *)v4.receiver;
  [(BeatingHeartView *)&v4 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI16BeatingHeartView_imageView];
  objc_msgSend(v3, sel_sizeToFit, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v3, sel_setFrame_, 0.0, 0.0);
}

- (_TtC9SeymourUI16BeatingHeartView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A7DE84C();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI16BeatingHeartView_state;

  sub_239EED098((uint64_t)v3);
}

@end