@interface DebugFormatDebuggerSourceViewController
- (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatDebuggerSourceViewController

- (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C0B8D1D0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0B8AEDC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(DebugFormatDebuggerSourceViewController *)&v8 viewWillAppear:v3];
  v5 = (void *)sub_1C151F48C();

  if (v5)
  {
    id v6 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
    if (v6)
    {
      id v7 = v6;
      objc_msgSend(v6, sel_setToolbarHidden_animated_, 0, 0);

      id v4 = v7;
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1C0B8B698();
}

- (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed39DebugFormatDebuggerSourceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C09CFC44((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_sourceFile, (uint64_t)v3);
  sub_1C0A0C01C(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1C02F609C);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController____lazy_storage___highlightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_lineNumberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController_edgeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed39DebugFormatDebuggerSourceViewController____lazy_storage___breakpointView));
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0B8BB4C(v4);
}

@end