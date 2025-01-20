@interface ShineView
- (_TtC5TeaUI9ShineView)initWithCoder:(id)a3;
- (_TtC5TeaUI9ShineView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShineView

- (_TtC5TeaUI9ShineView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI9ShineView *)ShineView.init(frame:)();
}

- (_TtC5TeaUI9ShineView)initWithCoder:(id)a3
{
  id v3 = a3;
  ShineView.init(coder:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI9ShineView____lazy_storage___shineMotionLayer));
  swift_release();
  swift_release();
}

- (void)layoutSubviews
{
  v2 = self;
  ShineView.layoutSubviews()();
}

@end