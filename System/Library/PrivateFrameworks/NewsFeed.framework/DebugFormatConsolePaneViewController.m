@interface DebugFormatConsolePaneViewController
- (_TtC8NewsFeed36DebugFormatConsolePaneViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed36DebugFormatConsolePaneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatConsolePaneViewController

- (_TtC8NewsFeed36DebugFormatConsolePaneViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_styler;
  type metadata accessor for DebugFormatStyler();
  v6 = (objc_class *)swift_allocObject();
  *((void *)v6 + 2) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;
  uint64_t v7 = OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_separatorView;
  id v8 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)objc_msgSend(v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed36DebugFormatConsolePaneViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C11C3830();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(DebugFormatConsolePaneViewController *)&v7 viewWillAppear:v3];
  id v5 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_logViewController], sel_toolbar, v7.receiver, v7.super_class);
  sub_1C149EB64(v5);

  id v6 = objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_debuggerPaneViewController], sel_toolbar);
  sub_1C149EB64(v6);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C11C3D24();
}

- (_TtC8NewsFeed36DebugFormatConsolePaneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed36DebugFormatConsolePaneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_logViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_debuggerPaneViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed36DebugFormatConsolePaneViewController_separatorView);
}

@end