@interface TableOfContentsPDFCellView
- (_TtC12NewsArticles26TableOfContentsPDFCellView)initWithCoder:(id)a3;
- (_TtC12NewsArticles26TableOfContentsPDFCellView)initWithFrame:(CGRect)a3;
@end

@implementation TableOfContentsPDFCellView

- (_TtC12NewsArticles26TableOfContentsPDFCellView)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles26TableOfContentsPDFCellView *)sub_1BF4B985C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles26TableOfContentsPDFCellView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles26TableOfContentsPDFCellView_imageView;
  id v6 = objc_allocWithZone((Class)sub_1BF7E0D78());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC12NewsArticles26TableOfContentsPDFCellView_borderLayer;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F39BE8]), sel_init);

  result = (_TtC12NewsArticles26TableOfContentsPDFCellView *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26TableOfContentsPDFCellView_imageView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles26TableOfContentsPDFCellView_borderLayer);
}

@end