@interface ReaderView
- (_TtC8StocksUI10ReaderView)initWithCoder:(id)a3;
- (_TtC8StocksUI10ReaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ReaderView

- (_TtC8StocksUI10ReaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI10ReaderView *)sub_20A5B8F60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI10ReaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A5B9538();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A5B9288();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI10ReaderView_contentBackgroundColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8StocksUI10ReaderView_contentView);
}

@end