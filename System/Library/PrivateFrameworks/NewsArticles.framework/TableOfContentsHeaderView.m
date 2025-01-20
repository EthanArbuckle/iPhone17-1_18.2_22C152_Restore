@interface TableOfContentsHeaderView
- (_TtC12NewsArticles25TableOfContentsHeaderView)initWithCoder:(id)a3;
- (_TtC12NewsArticles25TableOfContentsHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation TableOfContentsHeaderView

- (_TtC12NewsArticles25TableOfContentsHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles25TableOfContentsHeaderView *)sub_1BF6E4EAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles25TableOfContentsHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF6E52A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles25TableOfContentsHeaderView_coverViewButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles25TableOfContentsHeaderView_subscribeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles25TableOfContentsHeaderView_dateLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles25TableOfContentsHeaderView_descriptionLabel);
}

@end