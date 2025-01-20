@interface TableOfContentsViewController
- (_TtC12NewsArticles29TableOfContentsViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles29TableOfContentsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TableOfContentsViewController

- (_TtC12NewsArticles29TableOfContentsViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_pageIdentifierToDisplay);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC12NewsArticles29TableOfContentsViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles29TableOfContentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles29TableOfContentsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_blueprintViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29TableOfContentsViewController_purchasePresenter);
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF58FCEC();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF5902D8();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1BF590558((uint64_t)a3);
}

@end