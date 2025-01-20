@interface DebugFormatCodeDisplayViewController
- (_TtC8NewsFeed36DebugFormatCodeDisplayViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed36DebugFormatCodeDisplayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)doDismiss;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillLayoutSubviews;
@end

@implementation DebugFormatCodeDisplayViewController

- (_TtC8NewsFeed36DebugFormatCodeDisplayViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1DD8]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8NewsFeed36DebugFormatCodeDisplayViewController *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C0EFE038();
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatCodeDisplayViewController *)&v14 viewWillLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewLayoutMarginsDidChange
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugFormatCodeDisplayViewController *)&v14 viewLayoutMarginsDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_layoutMargins);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    MEMORY[0x1C18C6DE0](0.0, v7, v9, v11, v13);
    sub_1C151F2DC();
    objc_msgSend(v3, sel_setContentInset_);
  }
  else
  {
    __break(1u);
  }
}

- (void)doDismiss
{
}

- (_TtC8NewsFeed36DebugFormatCodeDisplayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed36DebugFormatCodeDisplayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_loader);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed36DebugFormatCodeDisplayViewController_textView);
}

@end