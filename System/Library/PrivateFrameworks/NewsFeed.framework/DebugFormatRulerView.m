@interface DebugFormatRulerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC8NewsFeed20DebugFormatRulerView)initWithCoder:(id)a3;
- (_TtC8NewsFeed20DebugFormatRulerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DebugFormatRulerView

- (_TtC8NewsFeed20DebugFormatRulerView)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed20DebugFormatRulerView *)sub_1C0659424();
}

- (_TtC8NewsFeed20DebugFormatRulerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C06597C4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0658EB0();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  id v7 = a4;
  v8 = (char *)v11.receiver;
  if (-[DebugFormatRulerView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {
    objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_horizontalRulerEdgeView], sel_frame, v11.receiver, v11.super_class);
    v12.double x = x;
    v12.double y = y;
    if (CGRectContainsPoint(v14, v12))
    {
      BOOL v9 = 1;
    }
    else
    {
      objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_verticalRulerEdgeView], sel_frame);
      v13.double x = x;
      v13.double y = y;
      BOOL v9 = CGRectContainsPoint(v15, v13);
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = (char *)v9.receiver;
  [(DebugFormatRulerView *)&v9 traitCollectionDidChange:v4];
  v6 = *(void **)&v5[OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_borderLayer];
  id v7 = objc_msgSend(self, sel_labelColor, v9.receiver, v9.super_class);
  id v8 = objc_msgSend(v7, sel_CGColor);

  objc_msgSend(v6, sel_setStrokeColor_, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_verticalRulerEdgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_horizontalRulerEdgeView));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed20DebugFormatRulerView_borderLayer);
}

@end