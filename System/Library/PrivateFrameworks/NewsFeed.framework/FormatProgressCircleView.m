@interface FormatProgressCircleView
- (_TtC8NewsFeed24FormatProgressCircleView)initWithCoder:(id)a3;
- (_TtC8NewsFeed24FormatProgressCircleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FormatProgressCircleView

- (_TtC8NewsFeed24FormatProgressCircleView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed24FormatProgressCircleView *)sub_1C0BCEB2C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed24FormatProgressCircleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0BCF17C();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(FormatProgressCircleView *)&v6 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  id v4 = objc_msgSend(self, sel_clearColor);
  id v5 = objc_msgSend(v4, sel_CGColor);

  objc_msgSend(v3, sel_setBackgroundColor_, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatProgressCircleView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed24FormatProgressCircleView_progressLayer));

  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed24FormatProgressCircleView_layerDelegate);
}

@end