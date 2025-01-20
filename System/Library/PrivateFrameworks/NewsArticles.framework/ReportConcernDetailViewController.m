@interface ReportConcernDetailViewController
- (_TtC12NewsArticles33ReportConcernDetailViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles33ReportConcernDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)send;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ReportConcernDetailViewController

- (_TtC12NewsArticles33ReportConcernDetailViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_selectedItemIndexPath;
  uint64_t v6 = sub_1BF7DD208();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController____lazy_storage___sendButton) = 0;
  id v7 = a3;

  result = (_TtC12NewsArticles33ReportConcernDetailViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles33ReportConcernDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles33ReportConcernDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_blueprintViewController));
  sub_1BF4E9A04((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_selectedItemIndexPath, &qword_1EA153B88, MEMORY[0x1E4F27DE8]);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController____lazy_storage___sendButton);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF4E6E78();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(ReportConcernDetailViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC12NewsArticles33ReportConcernDetailViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      uint64_t v6 = v5;
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

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ReportConcernDetailViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1BF4E9290();
}

- (void)send
{
  v2 = self;
  sub_1BF4E730C();
}

@end