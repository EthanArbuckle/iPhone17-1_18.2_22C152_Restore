@interface DebugFormatConsoleViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC8NewsFeed32DebugFormatConsoleViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed32DebugFormatConsoleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doPanGestureWithGesture:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatConsoleViewController

- (_TtC8NewsFeed32DebugFormatConsoleViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_consoleHeight;
  *(void *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_consolePanSession;
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)v5 = 0;
  v5[24] = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController____lazy_storage___panGestureRecognizer) = 0;
  id v6 = a3;

  result = (_TtC8NewsFeed32DebugFormatConsoleViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C03D2A44();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C03D2E78();
}

- (void)doPanGestureWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C03D3310(v4);
}

- (_TtC8NewsFeed32DebugFormatConsoleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed32DebugFormatConsoleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_editorContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController_consoleContainerController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed32DebugFormatConsoleViewController____lazy_storage___panGestureRecognizer);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1C03D3A34();

  return self & 1;
}

@end