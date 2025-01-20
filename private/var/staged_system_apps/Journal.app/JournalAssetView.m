@interface JournalAssetView
- (_TtC7Journal16JournalAssetView)initWithCoder:(id)a3;
- (_TtC7Journal16JournalAssetView)initWithFrame:(CGRect)a3;
@end

@implementation JournalAssetView

- (_TtC7Journal16JournalAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal16JournalAssetView *)sub_100454E48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal16JournalAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal16JournalAssetView *)sub_100454F5C(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7Journal16JournalAssetView_loadingDelegate;

  sub_1000109BC((uint64_t)v3);
}

@end