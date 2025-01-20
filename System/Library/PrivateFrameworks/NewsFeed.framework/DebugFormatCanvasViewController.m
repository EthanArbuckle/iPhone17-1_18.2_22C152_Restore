@interface DebugFormatCanvasViewController
- (_TtC8NewsFeed31DebugFormatCanvasViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatCanvasViewController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_viewportMonitor);
  v5 = self;
  id v6 = v4;
  sub_1C151BAFC();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(DebugFormatCanvasViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_contentView));
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_columnSystem;
  uint64_t v4 = sub_1C151759C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController____lazy_storage___columnView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_viewportMonitor));
  swift_release();
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed31DebugFormatCanvasViewController_scrollView);
}

- (_TtC8NewsFeed31DebugFormatCanvasViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0F8B09C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0F85EF4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C0F86330();
}

- (_TtC8NewsFeed31DebugFormatCanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed31DebugFormatCanvasViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C151BB1C();
}

@end