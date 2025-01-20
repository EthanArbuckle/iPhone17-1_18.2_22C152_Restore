@interface ArticleSharingViewController
- (NAArticleFooterDelegate)footerDelegate;
- (_TtC12NewsArticles28ArticleSharingViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles28ArticleSharingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)scrollViewController:(id)a3 didApplyDocumentStyle:(id)a4;
- (void)setFooterDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ArticleSharingViewController

- (NAArticleFooterDelegate)footerDelegate
{
  v2 = (void *)MEMORY[0x1C18B4040]((char *)self + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_footerDelegate, a2);
  return (NAArticleFooterDelegate *)v2;
}

- (void)setFooterDelegate:(id)a3
{
}

- (_TtC12NewsArticles28ArticleSharingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF7A9F70();
}

- (_TtC12NewsArticles28ArticleSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles28ArticleSharingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_footerDelegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_styler);
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareAction);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF7A9A34();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v8.receiver;
  id v5 = a3;
  [(ArticleSharingViewController *)&v8 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, sel_traitCollection, v8.receiver, v8.super_class);
  id v7 = objc_msgSend(v4, sel_view);
  if (v7)
  {

    sub_1BF76FDC8(*(void *)&v4[OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton]);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF7A9D00();
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double v5 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_topPadding);
  id v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_shareButton);
  id v7 = a4;
  objc_super v8 = self;
  objc_msgSend(v6, sel_intrinsicContentSize);
  double v10 = v5 + v9;
  double v11 = *(double *)((char *)&v8->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles28ArticleSharingViewController_bottomPadding);

  return v10 + v11;
}

- (void)scrollViewController:(id)a3 didApplyDocumentStyle:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1BF7AA05C((uint64_t)a4);

  swift_unknownObjectRelease();
}

@end