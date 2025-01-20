@interface ModalArticleViewerViewController
- (_TtC12NewsArticles32ModalArticleViewerViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles32ModalArticleViewerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)brandbarCtaButtonTapped;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ModalArticleViewerViewController

- (_TtC12NewsArticles32ModalArticleViewerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandbar) = 0;
  id v4 = a3;

  result = (_TtC12NewsArticles32ModalArticleViewerViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)brandbarCtaButtonTapped
{
  v2 = self;
  sub_1BF56E120();
}

- (_TtC12NewsArticles32ModalArticleViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles32ModalArticleViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandBarConfigManager);
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandBarRenderer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_content));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles32ModalArticleViewerViewController_brandbar);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF5C1538();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF5C1B60();
}

@end