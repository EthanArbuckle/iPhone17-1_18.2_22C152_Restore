@interface InterstitialAdPreviewViewController
- (_TtC12NewsArticles35InterstitialAdPreviewViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles35InterstitialAdPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)done;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation InterstitialAdPreviewViewController

- (_TtC12NewsArticles35InterstitialAdPreviewViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_coverViewManager;
  sub_1BF7DEFB8();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1BF7DEFA8();
  uint64_t v7 = OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_eventManager;
  sub_1BF51E7A8();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)sub_1BF7DD9D8();

  result = (_TtC12NewsArticles35InterstitialAdPreviewViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles35InterstitialAdPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles35InterstitialAdPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles35InterstitialAdPreviewViewController_interstitialModule);
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF69C758();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(InterstitialAdPreviewViewController *)&v5 viewDidAppear:v3];
  sub_1BF7DD9A8();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(InterstitialAdPreviewViewController *)&v3 viewDidLayoutSubviews];
  sub_1BF7DEF78();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1BF69CDFC((uint64_t)a3);
}

- (void)done
{
}

@end