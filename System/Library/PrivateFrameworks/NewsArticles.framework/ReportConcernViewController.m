@interface ReportConcernViewController
- (_TtC12NewsArticles27ReportConcernViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles27ReportConcernViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissVC;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ReportConcernViewController

- (_TtC12NewsArticles27ReportConcernViewController)initWithCoder:(id)a3
{
  result = (_TtC12NewsArticles27ReportConcernViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles27ReportConcernViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles27ReportConcernViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_styler);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_blueprintViewController);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF58B6A4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF58BA14();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(ReportConcernViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1BF58C2DC();
}

- (void)dismissVC
{
  v3 = __swift_project_boxed_opaque_existential_1(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_eventHandler)+ 6, (*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles27ReportConcernViewController_eventHandler))[9]);
  uint64_t v4 = MEMORY[0x1C18B4040](*v3 + 16);
  if (v4)
  {
    id v6 = (id)v4;
    id v5 = self;
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
}

@end