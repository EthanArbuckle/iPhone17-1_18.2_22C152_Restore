@interface ArticleFooterPaywall
- (NAArticleFooterDelegate)footerDelegate;
- (_TtC12NewsArticles20ArticleFooterPaywall)initWithCoder:(id)a3;
- (_TtC12NewsArticles20ArticleFooterPaywall)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (id)sectionItemViewController;
- (void)setFooterDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation ArticleFooterPaywall

- (NAArticleFooterDelegate)footerDelegate
{
  v2 = (void *)swift_unknownObjectRetain();
  return (NAArticleFooterDelegate *)v2;
}

- (void)setFooterDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_footerDelegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC12NewsArticles20ArticleFooterPaywall)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_footerDelegate) = 0;
  id v4 = a3;

  result = (_TtC12NewsArticles20ArticleFooterPaywall *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF698EF8();
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_paywallHeight);
}

- (id)sectionItemViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_paywallViewController));
}

- (_TtC12NewsArticles20ArticleFooterPaywall)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles20ArticleFooterPaywall *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles20ArticleFooterPaywall_paywallViewController);
}

@end