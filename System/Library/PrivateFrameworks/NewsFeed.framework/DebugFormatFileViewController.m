@interface DebugFormatFileViewController
- (_TtC8NewsFeed29DebugFormatFileViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed29DebugFormatFileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatFileViewController

- (_TtC8NewsFeed29DebugFormatFileViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_sourceMetrics) = 0;
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_styler;
  type metadata accessor for DebugFormatStyler();
  v6 = (objc_class *)swift_allocObject();
  *((void *)v6 + 2) = 0;
  *(Class *)((char *)&self->super.super.super.isa + v5) = v6;
  id v7 = a3;

  result = (_TtC8NewsFeed29DebugFormatFileViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0F15960();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(DebugFormatFileViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_fileViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (_TtC8NewsFeed29DebugFormatFileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed29DebugFormatFileViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed29DebugFormatFileViewController_fileViewController));
  swift_release();
}

@end