@interface FormatProgressPieView
- (_TtC8NewsFeed21FormatProgressPieView)initWithCoder:(id)a3;
- (_TtC8NewsFeed21FormatProgressPieView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FormatProgressPieView

- (_TtC8NewsFeed21FormatProgressPieView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed21FormatProgressPieView *)sub_1BFE6D0A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed21FormatProgressPieView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C12BABF4();
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(FormatProgressPieView *)&v6 layoutSubviews];
  id v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  id v4 = objc_msgSend(self, sel_clearColor);
  id v5 = objc_msgSend(v4, sel_CGColor);

  objc_msgSend(v3, sel_setBackgroundColor_, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21FormatProgressPieView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21FormatProgressPieView_progressLayer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed21FormatProgressPieView_layerDelegate);
}

@end