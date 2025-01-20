@interface CheckmarkAccessory
- (_TtC12NewsArticles18CheckmarkAccessory)initWithCoder:(id)a3;
- (_TtC12NewsArticles18CheckmarkAccessory)initWithFrame:(CGRect)a3;
@end

@implementation CheckmarkAccessory

- (_TtC12NewsArticles18CheckmarkAccessory)initWithFrame:(CGRect)a3
{
  return (_TtC12NewsArticles18CheckmarkAccessory *)sub_1BF594FA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NewsArticles18CheckmarkAccessory)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF595734();
}

- (void).cxx_destruct
{
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_linkedToggle);
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_toggleState;
  uint64_t v4 = sub_1BF7DE938();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_iconImageView));

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles18CheckmarkAccessory_onImage);
}

@end