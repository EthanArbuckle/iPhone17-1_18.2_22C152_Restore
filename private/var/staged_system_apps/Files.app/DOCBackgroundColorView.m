@interface DOCBackgroundColorView
- (_TtC5Files22DOCBackgroundColorView)initWithCoder:(id)a3;
- (_TtC5Files22DOCBackgroundColorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DOCBackgroundColorView

- (_TtC5Files22DOCBackgroundColorView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files22DOCBackgroundColorView *)sub_100524614(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files22DOCBackgroundColorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Files22DOCBackgroundColorView_backgroundLayer;
  id v6 = objc_allocWithZone((Class)CALayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files22DOCBackgroundColorView_layerBackgroundColor) = 0;

  result = (_TtC5Files22DOCBackgroundColorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100524814();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCBackgroundColorView_backgroundLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC5Files22DOCBackgroundColorView_layerBackgroundColor);
}

@end