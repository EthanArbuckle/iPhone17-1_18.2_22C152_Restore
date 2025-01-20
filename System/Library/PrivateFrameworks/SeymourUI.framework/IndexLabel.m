@interface IndexLabel
- (CGSize)intrinsicContentSize;
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (_TtC9SeymourUI10IndexLabel)initWithCoder:(id)a3;
- (_TtC9SeymourUI10IndexLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)textSizeUpdated:(id)a3;
@end

@implementation IndexLabel

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_239FD8794();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10IndexLabel_label), sel_firstBaselineAnchor);

  return (NSLayoutYAxisAnchor *)v2;
}

- (_TtC9SeymourUI10IndexLabel)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10IndexLabel *)sub_239FD8920(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_239FD8E60();
}

- (_TtC9SeymourUI10IndexLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FD965C();
}

- (void)textSizeUpdated:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  v8 = self;
  sub_239FD9060();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI10IndexLabel_labelCenterYConstraint);
}

@end