@interface ArticleNavigationBarPaletteContent
+ (double)paletteHeight;
- (_TtC12NewsArticles34ArticleNavigationBarPaletteContent)initWithCoder:(id)a3;
- (_TtC12NewsArticles34ArticleNavigationBarPaletteContent)initWithFrame:(CGRect)a3;
- (double)paletteHeight;
- (id)showMessage:(int64_t)a3;
- (void)compressWithScale:(double)a3 opacity:(double)a4;
- (void)layoutSubviews;
- (void)setBarColor:(id)a3;
- (void)setBarColorFor:(id)a3 primaryColor:(id)a4 secondaryColor:(id)a5 primaryVisibilityFactor:(double)a6;
@end

@implementation ArticleNavigationBarPaletteContent

+ (double)paletteHeight
{
  if (qword_1EA1510C8 != -1) {
    swift_once();
  }
  return *(double *)&qword_1EA155978;
}

- (_TtC12NewsArticles34ArticleNavigationBarPaletteContent)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_horizontalScrollOffset) = 0;
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_bottomPaletteButtonLocation) = 0;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for ArticleNavigationBarPaletteContent();
  v11 = -[ArticleNavigationBarPaletteContent initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  [(ArticleNavigationBarPaletteContent *)v11 addSubview:*(Class *)((char *)&v11->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar)];
  return v11;
}

- (_TtC12NewsArticles34ArticleNavigationBarPaletteContent)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_horizontalScrollOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_bottomPaletteButtonLocation) = 0;

  result = (_TtC12NewsArticles34ArticleNavigationBarPaletteContent *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)setBarColorFor:(id)a3 primaryColor:(id)a4 secondaryColor:(id)a5 primaryVisibilityFactor:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = self;
  sub_1BF600174(v10, (uint64_t)a4, a6);
}

- (void)setBarColor:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1BF600414(a3);
}

- (void)compressWithScale:(double)a3 opacity:(double)a4
{
  id v6 = self;
  sub_1BF600650(a3, a4);
}

- (double)paletteHeight
{
  uint64_t v2 = qword_1EA1510C8;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  double v4 = *(double *)&qword_1EA155978;

  return v4;
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  sub_1BF6009DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar));
}

- (id)showMessage:(int64_t)a3
{
  double v4 = self;
  ArticleNavigationBarPaletteContent.show(_:)(a3, &v12);

  uint64_t v5 = v13;
  if (v13)
  {
    id v6 = __swift_project_boxed_opaque_existential_1(&v12, v13);
    uint64_t v7 = *(void *)(v5 - 8);
    MEMORY[0x1F4188790](v6);
    id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    id v10 = (void *)sub_1BF7E4C38();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

@end