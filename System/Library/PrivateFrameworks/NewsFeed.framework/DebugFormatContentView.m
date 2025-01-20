@interface DebugFormatContentView
- (_TtC8NewsFeed22DebugFormatContentView)initWithCoder:(id)a3;
- (_TtC8NewsFeed22DebugFormatContentView)initWithFrame:(CGRect)a3;
- (double)contentScaleFactor;
- (void)setContentScaleFactor:(double)a3;
@end

@implementation DebugFormatContentView

- (double)contentScaleFactor
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(DebugFormatContentView *)&v3 contentScaleFactor];
  return result;
}

- (void)setContentScaleFactor:(double)a3
{
  v4 = self;
  sub_1C0FB4CD0(a3);
}

- (_TtC8NewsFeed22DebugFormatContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_contentFrame);
  _OWORD *v9 = 0u;
  v9[1] = 0u;
  uint64_t v10 = OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_bezelView;
  id v11 = objc_allocWithZone((Class)type metadata accessor for DebugFormatBezelView());
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v10) = (Class)objc_msgSend(v11, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v15.receiver = v12;
  v15.super_class = ObjectType;
  v13 = -[DebugFormatContentView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  [(DebugFormatContentView *)v13 addSubview:*(Class *)((char *)&v13->super.super.super.isa + OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_bezelView)];
  return v13;
}

- (_TtC8NewsFeed22DebugFormatContentView)initWithCoder:(id)a3
{
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_contentFrame);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  uint64_t v6 = OBJC_IVAR____TtC8NewsFeed22DebugFormatContentView_bezelView;
  id v7 = objc_allocWithZone((Class)type metadata accessor for DebugFormatBezelView());
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  double result = (_TtC8NewsFeed22DebugFormatContentView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end