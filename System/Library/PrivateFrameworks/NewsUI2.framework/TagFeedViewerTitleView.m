@interface TagFeedViewerTitleView
- (_TtC7NewsUI222TagFeedViewerTitleView)initWithCoder:(id)a3;
- (_TtC7NewsUI222TagFeedViewerTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TagFeedViewerTitleView

- (_TtC7NewsUI222TagFeedViewerTitleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView;
  id v10 = objc_allocWithZone(MEMORY[0x1E4F82CE0]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[TagFeedViewerTitleView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(TagFeedViewerTitleView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView)];
  return v12;
}

- (_TtC7NewsUI222TagFeedViewerTitleView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4F82CE0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI222TagFeedViewerTitleView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(TagFeedViewerTitleView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsUI222TagFeedViewerTitleView_titleView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (void).cxx_destruct
{
}

@end