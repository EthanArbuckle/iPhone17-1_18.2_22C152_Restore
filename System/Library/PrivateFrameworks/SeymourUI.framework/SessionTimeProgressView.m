@interface SessionTimeProgressView
- (BOOL)accessibilityShowRemaining;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9SeymourUI23SessionTimeProgressView)initWithCoder:(id)a3;
- (_TtC9SeymourUI23SessionTimeProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SessionTimeProgressView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionTimeProgressView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = v4;
  double v7 = v6;
  if (qword_268A0CA90 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_268A159F0;

  double v9 = v5 + v8 + 2.0;
  double v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(SessionTimeProgressView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A0F03D8();
}

- (_TtC9SeymourUI23SessionTimeProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A0F0C94();
}

- (_TtC9SeymourUI23SessionTimeProgressView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI23SessionTimeProgressView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23SessionTimeProgressView_ringGroup));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23SessionTimeProgressView_ringsView);
}

- (BOOL)accessibilityShowRemaining
{
  v2 = self;
  uint64_t v3 = sub_23A7FA048();
  uint64_t v5 = v4;
  if (v3 == sub_23A7FA048() && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_23A800FB8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8 & 1;
}

@end