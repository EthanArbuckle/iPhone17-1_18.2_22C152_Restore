@interface DebugFormatDebuggerViewController
- (_TtC8NewsFeed33DebugFormatDebuggerViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation DebugFormatDebuggerViewController

- (_TtC8NewsFeed33DebugFormatDebuggerViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeed33DebugFormatDebuggerViewController_selectedCallStackFrame;
  uint64_t v6 = type metadata accessor for FormatDebuggerCallStackFrame(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC8NewsFeed33DebugFormatDebuggerViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0FCB068();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed33DebugFormatDebuggerViewController_debuggerPaneViewController));
  swift_release();
  sub_1C0FCEAE8((uint64_t)self + OBJC_IVAR____TtC8NewsFeed33DebugFormatDebuggerViewController_selectedCallStackFrame, (uint64_t (*)(void))sub_1C0FCEA80);
}

@end