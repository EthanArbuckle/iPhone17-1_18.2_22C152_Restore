@interface PuffView
- (_TtC10StickersUI8PuffView)initWithCoder:(id)a3;
- (_TtC10StickersUI8PuffView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PuffView

- (void)layoutSubviews
{
  v2 = self;
  sub_25E499D5C();
}

- (_TtC10StickersUI8PuffView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI8PuffView_angle) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI8PuffView_favorsCenter) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC10StickersUI8PuffView_delegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI8PuffView____lazy_storage___imageView) = 0;
  id v5 = a3;

  result = (_TtC10StickersUI8PuffView *)sub_25E4A2EA0();
  __break(1u);
  return result;
}

- (_TtC10StickersUI8PuffView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_25E49BB2C((uint64_t)self + OBJC_IVAR____TtC10StickersUI8PuffView_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickersUI8PuffView____lazy_storage___imageView);
}

@end