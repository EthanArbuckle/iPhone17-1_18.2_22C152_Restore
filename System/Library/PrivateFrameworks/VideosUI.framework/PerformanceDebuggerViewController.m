@interface PerformanceDebuggerViewController
- (_TtC8VideosUI33PerformanceDebuggerViewController)init;
- (_TtC8VideosUI33PerformanceDebuggerViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI33PerformanceDebuggerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)clear;
- (void)setupWithPlaybackEventsDictionary:(id)a3;
@end

@implementation PerformanceDebuggerViewController

- (_TtC8VideosUI33PerformanceDebuggerViewController)init
{
  return (_TtC8VideosUI33PerformanceDebuggerViewController *)sub_1E37A7C98();
}

- (_TtC8VideosUI33PerformanceDebuggerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E37A80F0();
}

- (_TtC8VideosUI33PerformanceDebuggerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E37A8214();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI33PerformanceDebuggerViewController_text));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI33PerformanceDebuggerViewController____lazy_storage___textLabel);
}

- (void)setupWithPlaybackEventsDictionary:(id)a3
{
  sub_1E2BE915C(0, &qword_1EADF8968);
  sub_1E387C678();
  v4 = self;
  sub_1E37A82EC();

  swift_bridgeObjectRelease();
}

- (void)clear
{
  v2 = self;
  sub_1E37A8410();
}

@end