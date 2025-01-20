@interface ArticleNavigationBarMessageContainer
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithCoder:(id)a3;
- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithDefaultView:(id)a3;
- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithFrame:(CGRect)a3;
- (id)showMessage:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation ArticleNavigationBarMessageContainer

- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithDefaultView:(id)a3
{
  return (_TtC12NewsArticles36ArticleNavigationBarMessageContainer *)ArticleNavigationBarMessageContainer.init(defaultView:)(a3);
}

- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF5EF980();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_defaultView);
  v5 = self;
  [(ArticleNavigationBarMessageContainer *)v5 bounds];
  objc_msgSend(v4, sel_sizeThatFits_, v6, v7);
  double v9 = v8;

  double v10 = v9;
  double v11 = height;
  result.CGFloat height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1BF5EDC84();
}

- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC12NewsArticles36ArticleNavigationBarMessageContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_defaultView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_messageLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_clipView);
}

- (id)showMessage:(int64_t)a3
{
  v4 = self;
  ArticleNavigationBarMessageContainer.show(_:)(a3, (uint64_t)v12);

  uint64_t v5 = v13;
  if (v13)
  {
    double v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    double v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    double v10 = (void *)sub_1BF7E4C38();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  }
  else
  {
    double v10 = 0;
  }
  return v10;
}

@end