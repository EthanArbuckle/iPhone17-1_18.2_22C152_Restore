@interface HighlightTrackingView
- (_TtC12MobileSafari21HighlightTrackingView)initWithCoder:(id)a3;
- (_TtC12MobileSafari21HighlightTrackingView)initWithFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation HighlightTrackingView

- (_TtC12MobileSafari21HighlightTrackingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlight) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlightDidChange);
  v9 = (objc_class *)type metadata accessor for HighlightTrackingView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[HighlightTrackingView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_18C6B6240();
  sub_18C67F11C();
  uint64_t v6 = sub_18C6F9C18();
  id v7 = a4;
  v8 = self;
  sub_18C6B5DE8(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (_TtC12MobileSafari21HighlightTrackingView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlight) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlightDidChange);
  uint64_t v6 = (objc_class *)type metadata accessor for HighlightTrackingView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(HighlightTrackingView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlight));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlightDidChange);

  sub_18C3F33C8(v3);
}

@end